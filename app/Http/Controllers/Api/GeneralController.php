<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Validator;
use App\City;
use App\Company;
// use App\Order;
// use Carbon\Carbon;
use Intervention\Image\Facades\Image as InterventionImage;

class GeneralController extends Controller
{
    // test
    // public function testorder(Request $request) {
    //     // $time = $request->get('date');
    //     // $timeStamp = strtotime($time);

    //     // $today = Carbon::parse($request->get('date'));

    //     // $order = new Order();
    //     // $order->due_date = $today;
    //     // $order->save();

    //     $orders = Order::get();


    //     return response()->json(['success' => true, 'data' => $orders]);
    // }
    //test image
    public function testImage(Request $request) {

        if($request->get('image')) {
            // upload image
            $image = $request->get('image');
            $pos   = strpos($image, ';');
            $type  = explode('/', substr($image, 0, $pos))[1];
            $name  = "image_test_hani_" . date('d-m-Y-h-i-s') . "." . $type;
            $media = $name;
            $path  = storage_path("app/public/" . $media);
            InterventionImage::make(file_get_contents($image))->save($path);
            // end upload image
            return response()->json(['success' => true, 'data' => $media]);
        }

        return response()->json(['success' => false]);
    }
    // get image
    public function getImage($company_id = 0)
    {
        $company = Company::where('id', $company_id)->first();
        $path  = storage_path("app/public/" . $company->logo);
        $imagestr = file_get_contents($path);
        $image = imagecreatefromstring($imagestr);
        header('Content-type: image/png');
        // return imagejpeg($image);

        return InterventionImage::make($path)->response();
    }
    // -----
    public function getCities() {
        $cities = City::get();
        return response()->json(['success' => true, 'data' => $cities]);
    }

    public function addCity(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string'
        ]);
        if ($validator->fails()) {
            return response()->json(['success' => false, 'status' => 'validator_fails']);
        }

        $city = new City();
        $city->name = $request->get('name');
        $city->save();

        return response()->json(['success' => true]);

    }

}
