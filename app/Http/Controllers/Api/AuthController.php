<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Carbon\Carbon;
use JWTFactory;
use JWTAuth;
use Tymon\JWTAuthExceptions\JWTException;
use App\User;
use App\PasswordReset;
use App\Token;
use Auth;
use Hash;
use Password;
use Validator;
use App\Company;
use App\Customer;
use App\Driver;

class AuthController extends Controller
{
    private $user;

    public function __construct() {
        $this->user = auth()->guard('api')->user();
    }

    public function getUser(Request $request) {
        $user = User::where('id', Auth::user()->id)->with('role')->first();

        $userType = $user->type;
        if($userType == 1 || $userType == 4) {
            $userDetails = Company::where('id', $user->company_id)->with('city')->first();
        }elseif($userType == 2) {
            $userDetails = Customer::where('user_id', $user->id)->with('city')->first();
        }elseif($userType == 3) {
            $userDetails = Driver::where('user_id', $user->id)->with('company')->first();
        }

        return response()->json(['success' => true, 'data' => ['user' => $user, 'userDetails' => $userDetails]]);
    }

    public function deleteAccount(Request $request) {
        $credentials = $request->only('email', 'password');
        $currentUser = Auth::user();
        // $credentials = array('email' => $currentUser->email, 'password' => $request->get('oldPassword'));
        if (!$token = JWTAuth::attempt($credentials)) {
            return response()->json(['success' => false, 'status' => 'error_email_or_password']);
        }
        $_user = User::where('email', $currentUser->email)->first();
        $_user->password = Hash::make('XdeletedAccountX');
        $_user->email = 'X' . $currentUser->email . 'X';
        $_user->save();
        return response()->json(['success' => true]);
    }
    public function login(Request $request) {
        $credentials = $request->only('email', 'password');
        try {
            // verify the credentials and create a token for the user
            if (! $token = JWTAuth::attempt($credentials)) {
                return response()->json(['success' => false, 'status' => 'not_found']);
            }
        } catch (JWTException $e) {
            // something went wrong
            return response()->json(['error' => 'خطأ في تسجيل الدخول'], 500);
        }

        $user = User::where('id', Auth::user()->id)->with('role')->first();

        $userType = $user->type;
        if($userType == 1 || $userType == 4 || $userType == 5) {
            $userDetails = Company::where('id', $user->company_id)->with('city')->first();
        }elseif($userType == 2) {
            $userDetails = Customer::where('user_id', $user->id)->with('city')->first();
        }elseif($userType == 3) {
            $userDetails = Driver::where('user_id', $user->id)->with('company')->first();
        }

        // $unreadNotifications = UserMessage::where('user_id',$user->id)->where('read',0)->with('user')->orderBy('created_at', 'desc')->count();
        // if no errors are encountered we can return a JWT
        // return response()->json(['success' => true, 'token' => $token, 'user' => $user, 'userDetails' => $userDetails]);
        if($user->active) {
            return response()->json(['success' => true, 'token' => $token, 'user' => $user, 'userDetails' => $userDetails]);
        }else {
            return response()->json(['success' => false, 'status' => 'not_active']);
        }
    }

    public function logisticsRegister(Request $request) {

        $validator = Validator::make($request->all(), [
            'email' => 'required|max:255',
            'name' => 'required',
            'password'=> 'required',
            'type' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['success' => false, 'status' => 'validator_fails']);
        }
        if (User::Where('email', $request->get('email'))->first()) {
            return response()->json(['success' => false, 'status' => 'email_used']);
        }
        if ($request->get('type') == 3 && !Company::Where('oid', $request->get('company_oid'))->first()) {
            return response()->json(['success' => false, 'status' => 'error_oid']);
        }

        $company = Company::Where('oid', $request->get('company_oid'))->first();

        User::create([
            'name' => $request->get('name'),
            'email' => $request->get('email'),
            'password' => bcrypt($request->get('password')),
            'role_id' => 2
        ]);

        $user = User::where('email', '=', $request->get('email'))->first();
        $user->type = $request->get('type');
        $user->system_id = $request->get('system');
        if($request->get('type')!=3) {
            $user->active = 1;
        } else {
            $user->active = 0;
        }

        $user->save();

        $userDetails;
        if($request->get('type')==2){
            //Customer
            $userDetails = Customer::create();
            $userDetails->oid = $this->createOid();
            $userDetails->name = $request->get('c_name');
            $userDetails->city_id = $request->get('city');
            $userDetails->address = $request->get('address');
            $userDetails->phone = $request->get('phone');
            $userDetails->manager = $request->get('manager');
            $userDetails->system = $request->get('system');
            $userDetails->user_id = $user->id;
            $userDetails->save();
        } elseif($request->get('type')==3){
            //Driver
            $company = Company::where('oid', $request->get('company_oid'))->first();
            $userDetails = Driver::create();
            $userDetails->oid = $this->createOid();
            $userDetails->name = $request->get('name');
            $userDetails->system = $request->get('system');
            $userDetails->phone = $request->get('phone');
            $userDetails->company_id = $company->id;
            $userDetails->user_id = $user->id;
            $userDetails->save();
            $user = User::where('email', '=', $request->get('email'))->first();
            $user->company_id = $userDetails->id;
            $user->save();
        } else {
            //Company
            $userDetails = Company::create();
            $userDetails->oid = $this->createOid();
            $userDetails->name = $request->get('c_name');
            $userDetails->city_id = $request->get('city');
            $userDetails->address = $request->get('address');
            $userDetails->phone = $request->get('phone');
            $userDetails->manager = $request->get('manager');
            $userDetails->system = $request->get('system');
            $userDetails->user_id = $user->id;
            $userDetails->save();
            $user = User::where('email', '=', $request->get('email'))->first();
            $user->company_id = $userDetails->id;
            $user->save();
        }
        // if no errors
        return response()->json(['success' => true]);
    }

    // public function register(Request $request) {
    //     $validator = Validator::make($request->all(), [
    //         'email' => 'required|string|max:255',
    //         'name' => 'required',
    //         'password'=> 'required',
    //         'type' => 'required'
    //     ]);
    //     if ($validator->fails()) {
    //         return response()->json(['success' => false, 'message' => 'يجب أن يكون البريد الإلكتروني عنوان بريد إلكتروني صالح']);
    //     }
    //     if (User::Where('email', $request->get('email'))->first()) {
    //         return response()->json(['success' => false, 'message' => 'البريد الإلكتروني مستخدم']);
    //     }
    //     User::create([
    //         'name' => $request->get('name'),
    //         'email' => $request->get('email'),
    //         'password' => bcrypt($request->get('password')),
    //         'role_id' => $request->get('type'),
    //     ]);
    //     $credentials = $request->only('email', 'password');
    //     $token = $token = JWTAuth::attempt($credentials);

    //     $user = User::where('id', '=', Auth::user()->id)->with('role')->first();
    //     $user->role_id = $request->get('type');
    //     $user->save();
    //     // $userDetails;
    //     // if($request->get('type')==4){
    //     //     //employee
    //     //     $userDetails = EmployeeDetail::create();
    //     //     $userDetails->user_id = $user->id;
    //     //     $userDetails->status = 2;
    //     //     $userDetails->full_name = $request->get('name');
    //     //     $userDetails->email = $request->get('email');
    //     //     $userDetails->save();
    //     // }else{
    //     //     //Company
    //     //     $userDetails = CompanyDetail::create();
    //     //     $userDetails->user_id = $user->id;
    //     //     $userDetails->status = 2;
    //     //     $userDetails->full_name = $request->get('name');
    //     //     $userDetails->email = $request->get('email');
    //     //     $userDetails->save();
    //     // }
    //     // if no errors are encountered we can return a JWT
    //     return response()->json(['success' => true, 'token' => $token, 'user' => $user]);
    // }

    public function logout(Request $request) {
        $this->validate($request, ['token' => 'required']);

        try {
            auth()->logout();
            // JWTAuth::invalidate($request->input('token'));
            return response()->json(['success' => true, 'message'=> "لقد تم تسجيل الخروج بنجاح."]);
        } catch (JWTException $e) {
            // something went wrong whilst attempting to encode the token
            return response()->json(['success' => false, 'error' => 'فشل في تسجيل الخروج ، يرجى المحاولة مرة أخرى.'], 500);
        }
        return response()->json(['success' => true]);
    }

    public function recover(Request $request)
    {
        $user = User::where('email', $request->email)->first();
        if (!$user) {
            $error_message = "لم يتم العثور على عنوان بريدك الإلكتروني.";
            return response()->json(['success' => false, 'status' => 'email_not_found']);
        }
        try {
            Password::sendResetLink($request->only('email'), function (Message $message) {
                $message->subject('رابط إعادة تعيين كلمة المرور الخاصة بك');
            });
        } catch (\Exception $e) {
            $error_message = $e->getMessage();
            return response()->json(['success' => false, 'status' => 'send_email_error']);
        }
        return response()->json(['success' => true]);
    }

    public function reset(Request $request)
    {
        $isValid = false;
        $users = PasswordReset::where('email', $request->email)->get();
        foreach($users as $user) {
            if(Hash::check($request->token, $user->token)) {
                $isValid = true;
                $_user = User::where('email', $user->email)->first();
                $_user->password = Hash::make($request->password);
                $_user->save();
                return response()->json(['success' => true]);
            }
        }
        return response()->json($isValid);
    }

    public function check(Request $request)
    {
        $isValid = false;
        $users = PasswordReset::get();
        foreach($users as $user) {
            if(Hash::check($request->token, $user->token)) {
                $isValid = true;
            }
        }
        return response()->json($isValid);
    }

    public function changePassword(Request $request)
    {
        $currentUser = Auth::user();
        $credentials = array('email' => $currentUser->email, 'password' => $request->get('oldPassword'));
        if (! $token = JWTAuth::attempt($credentials)) {
            return response()->json(['success' => false, 'status' => 'not_found']);
        }
        $_user = User::where('email', $currentUser->email)->first();
        $_user->password = Hash::make($request->password);
        $_user->save();
        return response()->json(['success' => true, 'data' => $token, 'currentUser' => $currentUser]);
    }

    // ----- private functions -----
    private function createOid() {
        return strtoupper(substr(md5(uniqid(mt_rand(), true)), 0, 8));
    }
}
