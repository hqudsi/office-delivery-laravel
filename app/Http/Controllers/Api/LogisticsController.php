<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Intervention\Image\Facades\Image as InterventionImage;
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
use App\Service;
use App\Status;
use App\Order;
use App\OrderDetail;
use App\OrderCost;
use App\OrderDriver;
use App\PackSize;
use App\StatusDetail;
use App\Transaction;
use App\Collection;
use App\CustomerCollection;
use App\DriverCollectionVoucher;
use App\CustomerPayment;
use App\PackChange;
use App\DeleteOrder;

use Illuminate\Support\Facades\DB;

class LogisticsController extends Controller
{
    // ----- Get Functions -----
    public function getServices() {
        $services = Service::where('system',2)->get();
        return response()->json(['success' => true, 'data' => $services]);
    }

    public function getStatuses() {
        $statuses = Status::where('system_id',2)->orderBy('id')->get();
        return response()->json(['success' => true, 'data' => $statuses]);
    }

    public function getCompanies() {
        $companies = Company::where('system',2)->get();
        return response()->json(['success' => true, 'data' => $companies]);
    }

    public function getCustomers() {
        $customers = Customer::where('system',2)->get();
        return response()->json(['success' => true, 'data' => $customers]);
    }

    public function getDrivers() {
        $drivers = Driver::where('system',2)->get();
        return response()->json(['success' => true, 'data' => $drivers]);
    }

    public function getMyUsers(Request $request) {
        $users = User::where('company_id', $request->get('company_id'))->get();
        return response()->json(['success' => true, 'data' => $users]);
    }

    public function getMyCustomers(Request $request) {
        $company = Company::where('id', $request->get('company_id'))->with('customers')->with('customers.user')->with('customers.city')->first();
        return response()->json(['success' => true, 'data' => $company->customers]);
    }

    public function getMyDrivers(Request $request) {
        $drivers = Driver::where('company_id', $request->get('company_id'))->with('user')->get();
        // $drivers = Driver::with('user')->get();
        return response()->json(['success' => true, 'data' => $drivers]);
    }

    public function getMyCompanies(Request $request) {
        $customer = Customer::where('id', $request->get('customer_id'))->with('companies')->with('companies.user')->with('companies.city')->first();
        return response()->json(['success' => true, 'data' => $customer->companies]);
    }

    public function getMyCustomersWithCollection(Request $request) {
        $user_id = $request->get('company_id');

        $transactions = Transaction::where('company_id', $user_id)
                        ->groupBy('company_id', 'customer_id')
                        ->select('company_id', 'customer_id' , DB::raw('sum(amount) as collection'))
                        ->with('company')->with('customer')
                        ->get();
        return response()->json(['success' => true, 'data' => $transactions]);
    }

    public function getPackSizes() {
        $packSizes = PackSize::where('system',2)->get();
        return response()->json(['success' => true, 'data' => $packSizes]);
    }

    public function getOrders(Request $request) {
        $type = $request->get('type');
        $status = $request->get('status');
        $statusMulti = $request->get('status_multi');
        $financialStatus = $request->get('financial_status');
        $financialStatusMulti = $request->get('financial_status_multi');
        $order_id = $request->get('order_id');
        $city = $request->get('city_id');
        $fromDate = $request->get('from_date');
        $toDate = $request->get('to_date');
        $driver = $request->get('driver_id');
        $customer = $request->get('customer_id');
        $endCustomerName = $request->get('end_customer_name');
        $orders = Order::where('system', 2)
            ->with('from')->with('to')->with('status')->with('company')
            ->with('customer')->with('driver')->with('orderCosts')
            ->with('orderDetails')->with('orderDetails.packSize')
            ->with('customerPaymentObject')->with('driverCollection')
            ->orderBy('created_at', 'DESC');


        if ($type == 1 || $type == 4 || $type == 5) { // company
            $orders = $orders->where('company_id', $request->get('company_id'));
        } elseif ($type == 3) { // driver
            $orders = $orders->where('driver_id', $request->get('user_id'));
        } elseif ($type == 2) { // customer
            $orders = $orders->where('customer_id', $request->get('user_id'));
        }
        if ($status != null && $status != 'null') {
            $orders = $orders->where('status_id', $status);
        }
        if ($statusMulti !== 'null' && $statusMulti !== null) {
            $orders = $orders->whereIn('status_id', $statusMulti);
        }
        if ($financialStatus !== 'null' && $financialStatus !== null) {
            $orders = $orders->where('financial_status', $financialStatus);
        }
        if ($financialStatusMulti !== 'null' && $financialStatusMulti !== null) {
            $orders = $orders->whereIn('financial_status', $financialStatusMulti);
        }
        if ($city !== 'null' && $city !== null) {
            $orders = $orders->where('to_id', $city);
        }
        if ($fromDate !== 'null' && $fromDate !== null) {
            $orders = $orders->whereDate('created_at', '>=', $fromDate);
        }
        if ($toDate !== 'null' && $toDate !== null) {
            $orders = $orders->whereDate('created_at', '<=', $toDate);
        }
        if ($driver !== 'null' && $driver !== null) {
            $orders = $orders->where('driver_id', $driver);
        }
        if ($customer !== 'null' && $customer !== null) {
            $orders = $orders->where('customer_id', $customer);
        }
        if ($endCustomerName !== 'null' && $endCustomerName !== null) {
            $orders = $orders->where('end_customer_name', 'like', '%' . $endCustomerName . '%');
        }
        if ($order_id !== 'null' && $order_id !== null) {
            $orders = $orders->where('oid', 'like', '%' . $order_id . '%');
        }

        $orders = $orders->paginate(20);
        return response()->json(['success' => true, 'data' => $orders]);
    }

    public function getOrderStatuses(Request $request){
        $orderId = $request->get('id');
        $statuses = StatusDetail::where('order_id', $orderId)->with('status')->get();
        return response()->json(['success' => true, 'data' => $statuses]);
    }

    public function getOrderStatusesByOid(Request $request){
        $orderOid = $request->get('oid');
        $userType = $request->get('user_type');
        $companyId = $request->get('company_id');
        if ($userType === 2) {
            $order = Order::where('customer_id', $companyId)->where('oid', 'like', '%' . $orderOid . '%')->first();
        } else {
            $order = Order::where('company_id', $companyId)->where('oid', 'like', '%' . $orderOid . '%')->first();
        }
        if ($order) {
            $statuses = StatusDetail::where('order_id', $order->id)->with('status')->get();
            return response()->json(['success' => true, 'data' => ['statuses' => $statuses, 'order_id' => $order->oid]]);
        } else {
            return response()->json(['success' => false, 'status' => 'not_found']);
        }
    }

    public function getUserOrdersStatistics(Request $request) {
        $current_user_id = $request->get('userId');
        $current_user_type = $request->get('userType');
        $user_type;
        $user_id;
        switch ($current_user_type) {
            case 1:
                //   code to be executed if user company;
                $user_type = 'company_id';
                $user_id = Company::where('user_id', $current_user_id)->value('id');
                break;
            case 2:
                //   code to be executed if user customer;
                $user_type = 'customer_id';
                $user_id = Customer::where('user_id', $current_user_id)->value('id');
                break;
            case 3:
                //   code to be executed if user driver;
                $user_type = 'driver_id';
                $user_id = Driver::where('user_id', $current_user_id)->value('id');
                break;
          }
        $allOrders = Order::where('system', 2)->where($user_type, $user_id)->count();
        $newOrders = Order::where('system', 2)->where($user_type, $user_id)->where('status_id', 1)->count();
        $inprogressOrders = Order::where('system', 2)->where($user_type, $user_id)->where('status_id', 5)->count();
        $doneOrders = Order::where('system', 2)->where($user_type, $user_id)->where('status_id', 6)->count();
        $backOrders = Order::where('system', 2)->where($user_type, $user_id)->where('status_id', 7)->count();
        $canceledOrders = Order::where('system', 2)->where($user_type, $user_id)->where('status_id', 8)->count();
        return response()->json(
            [
                'success' => true,
                'data' => [
                    'newOrders' => $newOrders,
                    'allOrders' => $allOrders,
                    'inprogressOrders' => $inprogressOrders,
                    'doneOrders' => $doneOrders,
                    'backOrders' => $backOrders,
                    'canceledOrders' => $canceledOrders

                ]
            ]
        );
    }

    public function getMyOrdersStatistics(Request $request) {
        $current_user= Auth::user();
        // $company = Company::where('user_id', $current_user_id)->first();
        // $driver = Driver::where('user_id', $current_user_id)->first();
        // $customer = Customer::where('id', $request->get('customer'))->first();
        $user_type;
        $user_id;
        switch ($current_user->type) {
            case 1: case 4: case 5:
                //   code to be executed if user company;
                $user_type = 'company_id';
                $user_id = Company::where('id', $current_user->company_id)->value('id');
                break;
            case 2:
                //   code to be executed if user customer;
                $user_type = 'customer_id';
                $user_id = Customer::where('user_id', $current_user->id)->value('id');
                break;
            case 3:
                //   code to be executed if user driver;
                $user_type = 'driver_id';
                $user_id = Driver::where('user_id', $current_user->id)->value('id');
                break;
          }
        $allOrders = Order::where('system', 2)->where($user_type, $user_id)->count();
        $newOrders = Order::where('system', 2)->where($user_type, $user_id)->where('status_id', 1)->count();
        $incompanyOrders = Order::where('system', 2)->where($user_type, $user_id)->where('status_id', 2)->count();
        $sortingOrders = Order::where('system', 2)->where($user_type, $user_id)->where('status_id', 3)->count();
        $parkedOrders = Order::where('system', 2)->where($user_type, $user_id)->where('status_id', 4)->count();
        $inprogressOrders = Order::where('system', 2)->where($user_type, $user_id)->where('status_id', 5)->count();
        $deliveredOrders = Order::where('system', 2)->where($user_type, $user_id)->where('status_id', 6)->count();
        $returnOrders = Order::where('system', 2)->where($user_type, $user_id)->where('status_id', 7)->count();
        $canceledOrders = Order::where('system', 2)->where($user_type, $user_id)->where('status_id', 8)->count();
        return response()->json(
            [
                'success' => true,
                'data' => [
                    'allOrders' => $allOrders,
                    'newOrders' => $newOrders,
                    'incompanyOrders' => $incompanyOrders,
                    'sortingOrders' => $sortingOrders,
                    'parkedOrders' => $parkedOrders,
                    'inprogressOrders' => $inprogressOrders,
                    'deliveredOrders' => $deliveredOrders,
                    'returnOrders' => $returnOrders,
                    'canceledOrders' => $canceledOrders
                ]
            ]
        );
    }

    public function testOrdersStatistics() {
        $orders = Order::where('system', 2)
                    ->groupBy('status_id')
                    ->select('status_id', DB::raw('count(*) as total'))
                    ->get();
                    // ->pluck('status_id','total');
        return response()->json(['success' => true, 'data' => $orders]);
    }

    public function getMyCollectionStatistics(Request $request) {
        $current_user= Auth::user();

        $user_type;
        $user_id;
        switch ($current_user->type) {
            case 1: case 4: case 5:
                //   code to be executed if user company;
                $user_type = 'company_id';
                $user_id = Company::where('id', $current_user->company_id)->value('id');
                break;
            case 2:
                //   code to be executed if user customer;
                $user_type = 'customer_id';
                $user_id = Customer::where('user_id', $current_user->id)->value('id');
                $debit = Transaction::where($user_type, $user_id)->where('amount', '<', 0)->sum('amount');
                $credit = Transaction::where($user_type, $user_id)->where('amount', '>', 0)->sum('amount');
                $balance = abs($debit) - abs($credit);
                return response()->json(
                    [
                        'success' => true,
                        'data' => [
                            'debit' => abs($debit),
                            'credit' => abs($credit),
                            'balance' => $balance
                        ]
                    ]
                );
                // return response()->json(['success' => false, 'status' => 'customer_not_have']);
                break;
            case 3:
                //   code to be executed if user driver;
                $user_type = 'driver_id';
                $user_id = Driver::where('user_id', $current_user->id)->value('id');
                break;
          }
        $orders = Order::where($user_type, $user_id)->pluck('id')->toArray();

        // $totalToCollect = OrderCost::whereIn('order_id', $orders)->where('returned', '!=', 1)->where('canceled', '!=', 1)->sum('to_collect');
        $totalToCollect = OrderCost::whereIn('order_id', $orders)
                                    ->where(function ($query) {
                                        $query->where('canceled', 0)
                                            ->orWhereNull('canceled');
                                    })
                                    ->where(function ($query) {
                                        $query->where('returned', 0)
                                            ->orWhereNull('returned');
                                    })
                                    ->sum('to_collect');
        $collection = Collection::where($user_type, $user_id)->sum('received');
        $collectionRemaining = $totalToCollect - $collection;

        $totalPackageCost = OrderCost::whereIn('order_id', $orders)->where('pay_on_delivery', 1)
                                    ->where(function ($query) {
                                        $query->where('canceled', 0)
                                            ->orWhereNull('canceled');
                                    })
                                    ->where(function ($query) {
                                        $query->where('returned', 0)
                                            ->orWhereNull('returned');
                                    })
                                    ->sum('packages_cost');
        $payment = Collection::where($user_type, $user_id)->sum('package_cost');
        $paymentRemaining = $totalPackageCost - $payment;

        $totalTransCost = OrderCost::whereIn('order_id', $orders)->where('who_pays', '!=', 3)
                                    ->where(function ($query) {
                                        $query->where('canceled', 0)
                                            ->orWhereNull('canceled');
                                    })
                                    ->where(function ($query) {
                                        $query->where('returned', 0)
                                            ->orWhereNull('returned');
                                    })
                                    ->sum('trans_cost');
        $revenue = Collection::where($user_type, $user_id)->sum('trans_cost');
        $revenue = $revenue + CustomerCollection::where($user_type, $user_id)->sum('trans_cost');
        $revenueRemaining = $totalTransCost - $revenue;

        $debit = Transaction::where($user_type, $user_id)->where('amount', '>', 0)->sum('amount');
        $credit = Transaction::where($user_type, $user_id)->where('amount', '<', 0)->sum('amount');
        $balance = abs($debit) - abs($credit);

        $totalReturnCost = OrderCost::whereIn('order_id', $orders)->where('who_pays', '!=', 3)->where('returned', 1)->sum('return_cost');

        return response()->json(
            [
                'success' => true,
                'data' => [
                    'totalToCollect' => $totalToCollect,
                    'collection' => $collection,
                    'collectionRemaining' => $collectionRemaining,
                    'totalPackageCost' => $totalPackageCost,
                    'payment' => $payment,
                    'paymentRemaining' => $paymentRemaining,
                    'totalTransCost' => $totalTransCost,
                    'revenue' => $revenue,
                    'revenueRemaining' => $revenueRemaining,

                    'debit' => abs($debit),
                    'credit' => abs($credit),
                    'balance' => $balance,

                    'totalReturnCost' => $totalReturnCost
                ]
            ]
        );
    }

    public function getMyDriverCollection(Request $request) {

        $user_type = 'driver_id';
        $user_id = $request->get('driver_id');

        $orders = Order::where($user_type, $user_id)->pluck('id')->toArray();

        // $totalToCollect = OrderCost::whereIn('order_id', $orders)->where('returned', '!=', 1)->where('canceled', '!=', 1)->sum('to_collect');
        $totalToCollect = OrderCost::whereIn('order_id', $orders)
                                    ->where(function ($query) {
                                        $query->where('canceled', 0)
                                            ->orWhereNull('canceled');
                                    })
                                    ->where(function ($query) {
                                        $query->where('returned', 0)
                                            ->orWhereNull('returned');
                                    })
                                    ->sum('to_collect');
        $collection = Collection::where($user_type, $user_id)->sum('received');
        $collectionRemaining = $totalToCollect - $collection;

        $totalPackageCost = OrderCost::whereIn('order_id', $orders)->where('pay_on_delivery', 1)
                                    ->where(function ($query) {
                                        $query->where('canceled', 0)
                                            ->orWhereNull('canceled');
                                    })
                                    ->where(function ($query) {
                                        $query->where('returned', 0)
                                            ->orWhereNull('returned');
                                    })
                                    ->sum('packages_cost');
        $payment = Collection::where($user_type, $user_id)->sum('package_cost');
        $paymentRemaining = $totalPackageCost - $payment;

        $totalTransCost = OrderCost::whereIn('order_id', $orders)->where('who_pays', '!=', 3)
                                    ->where(function ($query) {
                                        $query->where('canceled', 0)
                                            ->orWhereNull('canceled');
                                    })
                                    ->where(function ($query) {
                                        $query->where('returned', 0)
                                            ->orWhereNull('returned');
                                    })
                                    ->sum('trans_cost');
        $revenue = Collection::where($user_type, $user_id)->sum('trans_cost');
        $revenue = $revenue + CustomerCollection::where($user_type, $user_id)->sum('trans_cost');
        $revenueRemaining = $totalTransCost - $revenue;

        $totalReturnCost = OrderCost::whereIn('order_id', $orders)->where('who_pays', '!=', 3)->where('returned', 1)->sum('return_cost');

        return response()->json(
            [
                'success' => true,
                'data' => [
                    'totalToCollect' => $totalToCollect,
                    'collection' => $collection,
                    'collectionRemaining' => $collectionRemaining,
                    'totalPackageCost' => $totalPackageCost,
                    'payment' => $payment,
                    'paymentRemaining' => $paymentRemaining,
                    'totalTransCost' => $totalTransCost,
                    'revenue' => $revenue,
                    'revenueRemaining' => $revenueRemaining,

                    'totalReturnCost' => $totalReturnCost
                ]
            ]
        );
    }

    public function getMyCollectionDashboard(Request $request) {
        $current_user= Auth::user();

        $user_type;
        $user_id;
        switch ($current_user->type) {
            case 1: case 4:
                //   code to be executed if user company;
                $user_type = 'company_id';
                $user_id = Company::where('id', $current_user->company_id)->value('id');
                break;
            case 2:
                //   code to be executed if user customer;
                $user_type = 'customer_id';
                $user_id = Customer::where('user_id', $current_user->id)->value('id');
                return response()->json(['success' => false, 'status' => 'customer_not_have']);
                break;
            case 3:
                //   code to be executed if user driver;
                $user_type = 'driver_id';
                $user_id = Driver::where('user_id', $current_user->id)->value('id');
                break;
          }

        $collection = Collection::where($user_type, $user_id)->sum('received');
        $payment = Collection::where($user_type, $user_id)->sum('package_cost');
        $revenue = Collection::where($user_type, $user_id)->sum('trans_cost');
        $customerRevenue = CustomerCollection::where($user_type, $user_id)->sum('trans_cost');
        return response()->json(
            [
                'success' => true,
                'data' => [
                    'collection' => $collection,
                    'payment' => $payment - $customerRevenue,
                    'revenue' => $revenue + $customerRevenue
                ]
            ]
        );
    }

    public function getMyTransactionsDashboard(Request $request) {
        $current_user= Auth::user();
        $user_type = 'customer_id';
        $user_id = Customer::where('user_id', $current_user->id)->value('id');
        $debit = Transaction::where($user_type, $user_id)->where('amount', '<', 0)->sum('amount');
        $credit = Transaction::where($user_type, $user_id)->where('amount', '>', 0)->sum('amount');
        $balance = abs($debit) - abs($credit);
        return response()->json(
            [
                'success' => true,
                'data' => [
                    'debit' => abs($debit),
                    'credit' => abs($credit),
                    'balance' => $balance
                ]
            ]
        );
    }

    public function getMyCompaniesCollection(Request $request) {
        $user_type = $request->get('user_type');
        $user_id = $request->get('user_id');

        $transactions = Transaction::where($user_type, $user_id)
                        ->groupBy('company_id', 'customer_id')
                        ->select('company_id', 'customer_id' , DB::raw('sum(amount) as collection'))
                        ->with('company')->with('customer')
                        ->get();
        return response()->json(['success' => true, 'data' => $transactions]);
    }

    public function getMyCustomerCollection(Request $request) {
        $company_id = $request->get('company_id');
        $customer_id = $request->get('customer_id');
        $transactions = Transaction::where('company_id', $company_id)->where('customer_id', $customer_id)
                        ->groupBy('company_id', 'customer_id')
                        ->select('company_id', 'customer_id' , DB::raw('sum(amount) as collection'))
                        ->with('company')->with('customer')
                        ->first();
        return response()->json(['success' => true, 'data' => $transactions]);
    }

    public function getTransactions(Request $request) {
        $company_id = $request->get('company_id');
        $customer_id = $request->get('customer_id');
        $transactions = Transaction::where('company_id', $company_id)
                        ->where('customer_id', $customer_id)
                        ->with('order')
                        ->orderBy('created_at', 'desc')
                        ->orderBy('trans_type', 'desc')
                        ->get();
        return response()->json(['success' => true, 'data' => $transactions]);
    }

    // public function testCollectionStatistics() {
    //     // $collection = Collection::sum('received');
    //     // $revenue = Collection::sum('trans_cost');
    //     // $payment = Collection::sum('package_cost');

    //     $orders = Transaction::groupBy('company_id')->selectRaw('company_id, sum(amount) as collection')->get();
    //     return response()->json(['success' => true, 'data' => $orders]);
    // }

    // ----- Post Functions -----
    public function addCompanyCustomer(Request $request) {
        $validator = Validator::make($request->all(), [
            'oid' => 'required|string|max:8',
            'company_id' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['success' => false, 'status' => 'validator_fails']);
        }

        $newOid = strtoupper($request->get('oid'));
        $customer = Customer::Where('oid', $newOid)->first();
        if (!$customer) {
            return response()->json(['success' => false, 'status' => 'no_customer']);
        } else {
            $hasData = DB::select('select * from company_customers where company_id = ? and customer_id = ?', [$request->company_id, $customer->id]);
            if ($hasData) {
                return response()->json(['success' => false, 'status' => 'alrady_has_customer']);
            } else {
                DB::insert('insert into company_customers (company_id, customer_id) values (?, ?)', [$request->company_id, $customer->id]);
                return response()->json(['success' => true]);
            }
        }

    }

    public function addNewCompanyCustomer(Request $request) {

        $validator = Validator::make($request->all(), [
            'email' => 'required|max:255',
            'name' => 'required',
            'company_id' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['success' => false, 'status' => 'validator_fails']);
        }
        if (User::Where('email', $request->get('email'))->first()) {
            return response()->json(['success' => false, 'status' => 'email_used']);
        }

        // $company = Company::Where('oid', $request->get('company_oid'))->first();

        User::create([
            'name' => $request->get('name'),
            'email' => $request->get('email'),
            'password' => bcrypt('password'),
            'role_id' => 2
        ]);

        $user = User::where('email', '=', $request->get('email'))->first();
        $user->type = 2;
        $user->system_id = $request->get('system');
        $user->active = 1;
        $user->save();

        $userDetails;
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
        // add customer to company
        // $newOid = strtoupper($request->get('oid'));
        // $customer = Customer::Where('oid', $newOid)->first();
        DB::insert('insert into company_customers (company_id, customer_id) values (?, ?)', [$request->company_id, $userDetails->id]);
        // if no errors
        return response()->json(['success' => true]);
    }

    public function addNewCompanyUser(Request $request) {

        $validator = Validator::make($request->all(), [
            'email' => 'required|max:255',
            'name' => 'required',
            'company_id' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['success' => false, 'status' => 'validator_fails']);
        }
        if (User::Where('email', $request->get('email'))->first()) {
            return response()->json(['success' => false, 'status' => 'email_used']);
        }

        // $company = Company::Where('oid', $request->get('company_oid'))->first();

        User::create([
            'name' => $request->get('name'),
            'email' => $request->get('email'),
            'password' => bcrypt('password'),
            'role_id' => 2
        ]);

        $user = User::where('email', '=', $request->get('email'))->first();
        $user->type = $request->get('type');
        $user->system_id = $request->get('system');
        $user->company_id = $request->get('company_id');
        $user->active = 1;
        $user->save();

        //Driver
        if($request->get('type')==3){
            //Driver
            $userDetails = Driver::create();
            $userDetails->oid = $this->createOid();
            $userDetails->name = $request->get('name');
            $userDetails->system = $request->get('system');
            $userDetails->phone = $request->get('phone');
            $userDetails->company_id = $request->get('company_id');
            $userDetails->user_id = $user->id;
            $userDetails->save();
        }
        // if no errors
        return response()->json(['success' => true]);
    }

    public function addUserByCompany(Request $request) {

        $validator = Validator::make($request->all(), [
            'email' => 'required|max:255',
            'name' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['success' => false, 'status' => 'validator_fails']);
        }
        if (User::Where('email', $request->get('email'))->first()) {
            return response()->json(['success' => false, 'status' => 'email_used']);
        }
        User::create([
            'name' => $request->get('name'),
            'email' => $request->get('email'),
            'password' => bcrypt($request->get('password')),
            'role_id' => 2
        ]);

        $user = User::where('email', '=', $request->get('email'))->first();
        $user->type = $request->get('type');
        $user->system_id = $request->get('system_id');
        $user->active = 0;
        $user->save();

        $userDetails;
        if($request->get('type')==2){
            //Customer
            $userDetails = Customer::create();
            $userDetails->oid = $this->createOid();
            $userDetails->name = $request->get('name');
            $userDetails->city_id = $request->get('city');
            $userDetails->address = $request->get('address');
            $userDetails->phone = $request->get('phone');
            $userDetails->manager = $request->get('manager');
            $userDetails->system = $request->get('system_id');
            $userDetails->user_id = $user->id;
            $userDetails->save();
        }else{
            //Driver
            $company = Company::where('oid', $request->get('company_oid'))->first();
            $userDetails = Driver::create();
            $userDetails->oid = $this->createOid();
            $userDetails->name = $request->get('name');
            $userDetails->notes = $request->get('notes');
            $userDetails->system = $request->get('system_id');
            $userDetails->company = $company->id;
            $userDetails->user_id = $user->id;
            $userDetails->save();
            $user = User::where('email', '=', $request->get('email'))->first();
            $user->company_id = $userDetails->id;
            $user->save();
        }
        // if no errors
        return response()->json(['success' => true]);
    }

    public function addOrder(Request $request) {
        $validator = Validator::make($request->all(), [
            'customer' => 'required',
            'company' => 'required',
            'end_customer_name' => 'required',
            'to' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['success' => false, 'status' => 'validator_fails']);
        }

        $current_user_id = Auth::user()->id;
        $company_id = $request->get('company');
        $company = Company::where('id', $request->get('company'))->first();
        $driver = Driver::where('id', $request->get('driver'))->first();
        // $company_id = $company->id;
        // if ($company) {
        //     $company_id = $company->id;
        // } else {
        //     $company_id = $driver->company_id;
        // }
        $customer = Customer::where('id', $request->get('customer'))->first();
        $order = new Order();
        $order->oid = $this->generateOrderOid();
        $order->company_id = $company_id;
        $order->customer_id = $request->get('customer');
        $order->from_id = $customer->city_id;
        $order->to_id = $request->get('to');
        $order->end_customer_name = $request->get('end_customer_name');
        $order->end_customer_phone = $request->get('end_customer_phone');
        $order->end_customer_address = $request->get('end_customer_address');
        $order->manual_number = $request->get('manual_number');
        $order->status_id = 1;
        if ($driver) {
            $order->driver_id = $driver->id;
        }
        $order->quantity = $request->get('quantity');
        $order->due_date = $request->get('due_date');
        $order->created_by = $current_user_id;
        $order->notes = $request->get('notes');
        $order->system = $request->get('system');
        $order->financial_status = 1;
        $order->customer_payment = 0;
        $order->save();
        // $order->oid = $this->createOid();
        // $order->save();
        // add details ---packages
        $details = $request->get('details');
        foreach($details as $detail) {
            $orderDetail = new OrderDetail();
            $orderDetail->order_id = $order->id;
            $orderDetail->service = $detail['service'];
            $orderDetail->quantity = $detail['quantity'];
            $orderDetail->amount = $detail['price'];
            $orderDetail->total = $detail['total'];
            $orderDetail->user = $current_user_id;
            $orderDetail->notes = $detail['notes'];
            $orderDetail->pack_size_id = $detail['pack_size'];
            $orderDetail->save();
        }

        $costs = $request->get('costs');
        $packageCost = 0;
        $transAmount = 0;
        $toCollectAmount = 0;
        if ($costs['pay_on_delivery']) {
            $packageCost = $costs['packages_cost'];
        }
        if ($costs['who_pays'] == 1) { // Sender
            $transAmount = ($packageCost - $costs['trans_cost']) * -1;
            // add Order Transaction - package cost
            $transaction = new Transaction();
            $transaction->order_id = $order->id;
            $transaction->company_id = $company_id;
            if ($driver) {
                $transaction->driver_id = $driver->id;
            }
            $transaction->customer_id = $customer->id;
            $transaction->amount = ($packageCost * -1);
            $transaction->trans_type = 1;
            $transaction->save();
            // add Order Transaction - trans cost
            $transaction = new Transaction();
            $transaction->order_id = $order->id;
            $transaction->company_id = $company_id;
            if ($driver) {
                $transaction->driver_id = $driver->id;
            }
            $transaction->customer_id = $customer->id;
            $transaction->amount = $costs['trans_cost'];
            $transaction->trans_type = 2;
            $transaction->save();
            // ----------------------
            $toCollectAmount = $packageCost;
        } else if ($costs['who_pays'] == 2) { // Reciver
            $transAmount = ($packageCost) * -1;
            // add Order Transaction - package cost
            $transaction = new Transaction();
            $transaction->order_id = $order->id;
            $transaction->company_id = $company_id;
            if ($driver) {
                $transaction->driver_id = $driver->id;
            }
            $transaction->customer_id = $customer->id;
            $transaction->amount = $transAmount;
            $transaction->trans_type = 1;
            $transaction->save();
            // ----------------------------
            $toCollectAmount = $packageCost + $costs['trans_cost'];
        } else if ($costs['who_pays'] == 3) { // free
            $transAmount = ($packageCost) * -1;
            // add Order Transaction - package cost
            $transaction = new Transaction();
            $transaction->order_id = $order->id;
            $transaction->company_id = $company_id;
            if ($driver) {
                $transaction->driver_id = $driver->id;
            }
            $transaction->customer_id = $customer->id;
            $transaction->amount = $transAmount;
            $transaction->trans_type = 1;
            $transaction->save();
            // ----------------------------
            $toCollectAmount = $packageCost;
        }

        // add costs
        if($costs) {
            $orderCost = new OrderCost();
            $orderCost->order_id = $order->id;
            $orderCost->user = $current_user_id;
            $orderCost->pay_on_delivery = $costs['pay_on_delivery'];
            $orderCost->who_pays = $costs['who_pays'];
            $orderCost->trans_cost = $costs['trans_cost'];
            $orderCost->packages_count = $costs['packages_count'];
            $orderCost->packages_cost = $costs['packages_cost'];
            $orderCost->to_collect = $toCollectAmount;
            $orderCost->received = 0;
            $orderCost->collected = 0;
            $orderCost->canceled = 0;
            $orderCost->returned = 0;
            $orderCost->save();
        }

        // add Order Status Details
        $orderStatus = new StatusDetail();
        $orderStatus->order_id = $order->id;
        $orderStatus->status_id = 1;
        $orderStatus->user = $current_user_id;
        $orderStatus->save();

        // // add Order Transaction
        // $transaction = new Transaction();
        // $transaction->order_id = $order->id;
        // $transaction->company_id = $company->id;
        // $transaction->customer_id = $customer->id;
        // $transaction->amount = $transAmount;
        // $transaction->trans_type = 1;
        // $transaction->save();

        // get order
        $currentOrder = Order::where('id', $order->id)
            ->with('from')->with('to')->with('status')
            ->with('company')->with('customer')->with('driver')->with('orderCosts')
            ->with('orderDetails')->with('orderDetails.packSize')
            ->with('customerPaymentObject')->with('driverCollection')
            ->first();
        // if no errors
        return response()->json(['success' => true, 'order' => $currentOrder]);
    }

    public function changeUserStatus(Request $request) {
        $current_user_id = Auth::user()->id;
        $user = User::where('id', $request->get('user_id'))->first();
        $user->active = $request->get('active');
        $user->save();
        return response()->json(['success' => true]);
    }

    public function changeDriverStatus(Request $request) {
        $current_user_id = Auth::user()->id;
        $user = User::where('id', $request->get('user_id'))->first();
        $user->active = $request->get('active');
        $user->save();
        return response()->json(['success' => true]);
    }

    public function changeOrderStatus(Request $request) {
        $current_user_id = Auth::user()->id;

        $order = Order::where('id', $request->get('id'))->first();
        $order->status_id = $request->get('status');
        $order->save();

        // add Order Status Details
        $orderStatus = new StatusDetail();
        $orderStatus->order_id = $order->id;
        $orderStatus->status_id = $request->get('status');
        $orderStatus->user = $current_user_id;
        $orderStatus->notes = $request->get('notes');
        $orderStatus->save();

        if ($request->get('status')==5) {
            // if status is inprogress
            $order = Order::where('id', $request->get('id'))->first();
            $order->driver_id = $request->get('driver_id');
            $order->save();
        } elseif ($request->get('status')==6) {
            // if status is Done
            $order = Order::where('id', $request->get('id'))->first();
            $order->received_date = date('Y-m-d H:i:s');
            $order->save();
        } elseif ($request->get('status')==7) {
            // if status is returned
            $current_user= Auth::user();

            $transactions = Transaction::where('order_id', $request->get('id'))
                                        ->where(function ($query) {
                                                    $query->where('trans_type', 1)
                                                        ->orWhere('trans_type', 2);
                                                })
                                        ->get();
            // reverse all transaction
            foreach($transactions as $transaction) {
                $newTransaction = new Transaction();
                $newTransaction->order_id = $transaction->order_id;
                $newTransaction->company_id = $transaction->company_id;
                $newTransaction->customer_id = $transaction->customer_id;
                $newTransaction->amount = $transaction->amount * -1;
                $newTransaction->collection_id = $transaction->collection_id;
                $newTransaction->trans_type = $transaction->trans_type + 3;
                $newTransaction->manual_number = $transaction->manual_number;
                $newTransaction->driver_id = $transaction->driver_id;
                $newTransaction->save();
            }
            // add transaction for return cost
            if ($request->get('amount')) {
                $newTransaction = new Transaction();
                $newTransaction->order_id = $request->get('id');
                $newTransaction->company_id = $request->get('company_id');
                $newTransaction->customer_id = $request->get('customer_id');
                if ($current_user->type == 3) {
                    $newTransaction->driver_id = Driver::where('user_id', $current_user->id)->value('id');
                }
                $newTransaction->amount = $request->get('amount');
                $newTransaction->trans_type = 6;
                $newTransaction->save();
            }
            // update order_costs table
            $orderCost = OrderCost::where('order_id', $request->get('id'))->first();
            $orderCost->returned = 1;
            $orderCost->return_cost = $request->get('amount');
            $orderCost->save();
        } elseif ($request->get('status')==8) {
        // if status is canceled
            $transactions = Transaction::where('order_id', $request->get('id'))
                                        ->where(function ($query) {
                                                    $query->where('trans_type', 1)
                                                        ->orWhere('trans_type', 2);
                                                })
                                        ->get();
            // reverse all transaction
            foreach($transactions as $transaction) {
                $newTransaction = new Transaction();
                $newTransaction->order_id = $transaction->order_id;
                $newTransaction->company_id = $transaction->company_id;
                $newTransaction->customer_id = $transaction->customer_id;
                $newTransaction->amount = $transaction->amount * -1;
                $newTransaction->collection_id = $transaction->collection_id;
                $newTransaction->trans_type = $transaction->trans_type + 3;
                $newTransaction->manual_number = $transaction->manual_number;
                $newTransaction->driver_id = $transaction->driver_id;
                $newTransaction->save();
            }
            // update order_costs table
            $orderCost = OrderCost::where('order_id', $request->get('id'))->first();
            $orderCost->canceled = 1;
            $orderCost->save();
        }
        // -------------------------------
        $newOrder = Order::where('id', $request->get('id'))
                    ->with('from')->with('to')->with('status')->with('company')->with('customer')->with('driver')->with('orderCosts')
                    ->first();
        return response()->json(['success' => true, 'data' => $newOrder]);
    }

    public function deleteOrder(Request $request)
    {
        $order = Order::where('id', $request->get('order_id'))->first();

        if ($order->status_id < 6) {
            $deleteOrder = new DeleteOrder();
            $deleteOrder->order_id = $order->id;
            $deleteOrder->user_id = Auth::user()->id;
            $deleteOrder->customer_id = $order->customer_id;
            $deleteOrder->to_collect = $request->get('to_collect');
            $deleteOrder->save();

            $order->orderCosts()->delete();
            $order->packChanges()->delete();
            $order->orderDetails()->delete();
            $order->statusDetails()->delete();
            $order->customerPaymentObject()->delete();
            $order->driverCollection()->delete();
            $order->orderDrivers()->delete();
            $order->collections()->delete();
            $order->customerCollections()->delete();
            $order->transactions()->delete();
            $order->financialStatusChanges()->delete();

            $order->delete();
        }

        return response()->json(['success' => true]);
    }

    public function editUser(Request $request)
    {
        $user = User::where('id', $request->get('user_id'))->first();
        $data = null;

        if ($user) {
            $user->name = $request->get('user_name');
            $user->save();
            if ($user->type === 2) { //customer
                $customer = Customer::where('user_id', $user->id)->first();
                $customer->name = $request->get('name');
                $customer->address = $request->get('address');
                $customer->phone = $request->get('phone');
                $customer->manager = $request->get('manager');
                $customer->city_id = $request->get('city_id');
                $customer->save();
                $data = Customer::where('id', $customer->id)->with('user')->with('city')->first();
            } else if ($user->type === 3) { //driver
                $driver = Driver::where('user_id', $user->id)->first();
                $driver->name = $request->get('name');
                $driver->phone = $request->get('phone');
                $driver->save();
                $data = Driver::where('id', $driver->id)->with('user')->first();
            }
            return response()->json(['success' => true, 'data' => $data]);
        } else {
            return response()->json(['success' => false, 'status' => 'no_order']);
        }
    }

    public function editOrder(Request $request)
    {
        $order = Order::where('id', $request->get('order_id'))
                        ->with('from')->with('to')->with('status')->with('company')->with('customer')->with('driver')->with('orderCosts')
                        ->first();
        if ($order) {
            $order->end_customer_name = $request->get('end_customer_name');
            $order->to_id = $request->get('city');
            $order->end_customer_address = $request->get('end_customer_address');
            $order->end_customer_phone = $request->get('end_customer_phone');
            $order->save();
            return response()->json(['success' => true, 'data' => $order]);
        } else {
            return response()->json(['success' => false, 'status' => 'no_order']);
        }
    }

    public function getPackChange(Request $request)
    {
        $companyId = $request->get('company_id');
        $orders = Order::where('company_id', $companyId)->pluck('id')->toArray();
        $packChanges = PackChange::whereIn('order_id', $orders)->with('user')->with('order')->paginate(20);
        return response()->json(['success' => true, 'data' => $packChanges]);
    }

    public function editPackage(Request $request)
    {
        $current_user_id = Auth::user()->id;
        $package = OrderDetail::where('id', $request->get('id'))->first();
        $order = Order::where('id', $package->order_id)->first();

        if ($package) {
            $oldAmount = $package->amount;

            $packChange = new PackChange();
            $packChange->pack_id = $request->get('id');
            $packChange->old_amount = $oldAmount;
            $packChange->new_amount = $request->get('amount');
            $packChange->user_id = $current_user_id;
            $packChange->order_id = $order->id;
            $packChange->change_type = 1;
            $packChange->save();

            $package->amount = $request->get('amount');
            $package->total = $request->get('amount') * $package->quantity;
            $package->save();


            // $orderCost = OrderCost::where('order_id', $package->order_id)->first();
            // $orderCost->packages_cost = $orderCost->packages_cost - $oldAmount + $request->get('amount');
            // $orderCost->save();
            $cost = OrderCost::where('order_id', $order->id)->first();


            $packageCost = 0;
            $transAmount = 0;
            $toCollectAmount = 0;
            if ($cost->pay_on_delivery) {
                $packageCost = $request->get('packages_cost');
            }
            $transaction = Transaction::where('order_id', $order->id)
                                        ->where('company_id', $order->company_id)
                                        ->where('customer_id', $order->customer_id)
                                        ->where('trans_type', 1)
                                        ->first();
            if ($cost->who_pays == 1) { // Sender
                $toCollectAmount = $packageCost;
                $transAmount = ($packageCost - $cost->trans_cost) * -1;
                $transaction->amount = ($packageCost * -1);
                $transaction->save();
            } else if ($cost->who_pays == 2) { // Reciver
                $toCollectAmount = $packageCost + $cost->trans_cost;
                $transAmount = ($packageCost) * -1;
                $transaction->amount = $transAmount;
                $transaction->save();
            } else if ($cost->who_pays == 3) { // free
                $toCollectAmount = $packageCost;
                $transAmount = ($packageCost) * -1;
                $transaction->amount = $transAmount;
                $transaction->save();
            }

            $cost->packages_cost = $request->get('packages_cost');
            $cost->to_collect = $toCollectAmount;
            $cost->save();

            $packages = OrderDetail::where('order_id', $order->id)->get();

            // get order
            $currentOrder = Order::where('id', $order->id)
            ->with('from')->with('to')->with('status')
            ->with('company')->with('customer')->with('driver')->with('orderCosts')
            ->with('orderDetails')->with('orderDetails.packSize')
            ->with('customerPaymentObject')->with('driverCollection')
            ->first();


            return response()->json(['success' => true, 'data' => $currentOrder]);
        } else {
            return response()->json(['success' => false, 'status' => 'no_package']);
        }
    }

    public function editWhoPay(Request $request)
    {
        $current_user_id = Auth::user()->id;
        $order = Order::where('id', $request->get('order_id'))->first();
        $cost = OrderCost::where('order_id', $order->id)->first();

        if ($cost) {
            $cost->who_pays = $request->get('who_pays');
            $cost->save();

            $packageCost = 0;
            $toCollectAmount = 0;
            if ($cost->pay_on_delivery) {
                $packageCost = $cost->packages_cost;
            }
            $transaction = Transaction::where('order_id', $order->id)
                                        ->where('company_id', $order->company_id)
                                        ->where('customer_id', $order->customer_id)
                                        ->where('trans_type', 2)
                                        ->first();
            if ($cost->who_pays == 1 || $cost->who_pays == '1') { // Sender
                $toCollectAmount = $packageCost;
                if ($transaction) {
                    $transaction->amount = $cost->trans_cost;
                    $transaction->save();
                } else {
                    // add Order Transaction - trans cost
                    $transaction = new Transaction();
                    $transaction->order_id = $order->id;
                    $transaction->company_id = $order->company_id;
                    $transaction->driver_id = $order->driver_id;
                    $transaction->customer_id = $order->customer_id;
                    $transaction->amount = $cost->trans_cost;
                    $transaction->trans_type = 2;
                    $transaction->save();
                    // ----------------------
                }

            } else if ($cost->who_pays == 2 || $cost->who_pays == '2') { // Reciver
                $toCollectAmount = $packageCost + $cost->trans_cost;
                if ($transaction) {
                    $transaction->delete();
                }
            } else if ($cost->who_pays == 3 || $cost->who_pays == '3') { // free
                $toCollectAmount = $packageCost;
                if ($transaction) {
                    $transaction->delete();
                }
            }

            $cost->to_collect = $toCollectAmount;
            $cost->save();


            // get order
            $currentOrder = Order::where('id', $order->id)
            ->with('from')->with('to')->with('status')
            ->with('company')->with('customer')->with('driver')->with('orderCosts')
            ->with('orderDetails')->with('orderDetails.packSize')
            ->with('customerPaymentObject')->with('driverCollection')
            ->first();


            return response()->json(['success' => true, 'data' => $currentOrder]);
        } else {
            return response()->json(['success' => false, 'status' => 'no_cost']);
        }
    }

    public function editTansCost(Request $request)
    {
        $current_user_id = Auth::user()->id;
        $order = Order::where('id', $request->get('order_id'))->first();
        $cost = OrderCost::where('order_id', $order->id)->first();

        if ($cost) {
            $oldAmount = $cost->trans_cost;

            $packChange = new PackChange();
            $packChange->old_amount = $oldAmount;
            $packChange->new_amount = $request->get('amount');
            $packChange->user_id = $current_user_id;
            $packChange->order_id = $order->id;
            $packChange->change_type = 2;
            $packChange->save();

            $cost->trans_cost = $request->get('amount');
            $cost->save();

            $packageCost = 0;
            $toCollectAmount = 0;
            if ($cost->pay_on_delivery) {
                $packageCost = $cost->packages_cost;
            }
            $transaction = Transaction::where('order_id', $order->id)
                                        ->where('company_id', $order->company_id)
                                        ->where('customer_id', $order->customer_id)
                                        ->where('trans_type', 2)
                                        ->first();
            if ($cost->who_pays == 1) { // Sender
                $toCollectAmount = $packageCost;
                $transaction->amount = $request->get('amount');
                $transaction->save();
            } else if ($cost->who_pays == 2) { // Reciver
                $toCollectAmount = $packageCost + $request->get('amount');
            } else if ($cost->who_pays == 3) { // free
                $toCollectAmount = $packageCost;
            }

            $cost->to_collect = $toCollectAmount;
            $cost->save();


            // get order
            $currentOrder = Order::where('id', $order->id)
            ->with('from')->with('to')->with('status')
            ->with('company')->with('customer')->with('driver')->with('orderCosts')
            ->with('orderDetails')->with('orderDetails.packSize')
            ->with('customerPaymentObject')->with('driverCollection')
            ->first();


            return response()->json(['success' => true, 'data' => $currentOrder]);
        } else {
            return response()->json(['success' => false, 'status' => 'no_cost']);
        }
    }

    public function editOrderDriver(Request $request)
    {
        $current_user_id = Auth::user()->id;
        $order = Order::where('id', $request->get('order_id'))->first();
        if ($order) {
            $order->driver_id = $request->get('driver_id');
            $order->save();

            $orderDriver = new OrderDriver();
            $orderDriver->order_id = $request->get('order_id');
            $orderDriver->driver_id = $request->get('driver_id');
            $orderDriver->user_id = $current_user_id;
            $orderDriver->save();

            $order = Order::where('id', $request->get('order_id'))
                        ->with('from')->with('to')->with('status')->with('company')->with('customer')->with('driver')->with('orderCosts')
                        ->first();

            return response()->json(['success' => true, 'data' => $order]);
        } else {
            return response()->json(['success' => false, 'status' => 'no_order']);
        }
    }

    public function getLoadingOrders(Request $request) {
        $companyId = $request->get('company_id');
        $orders = Order::where('status_id', 2)
                        ->orWhere('status_id', 3)
                        ->where('company_id', $companyId)
                        ->get();
                        // ->pluck('oid')->toArray();
        return response()->json(['success' => true, 'data' => $orders]);
    }

    public function getDriverCollectedOrders(Request $request) {
        $driverId = $request->get('driver_id');
        $orders = Order::where('status_id', 6)
                        ->where('driver_id', $driverId)
                        ->where('financial_status', 2)
                        ->with('orderCosts')
                        ->get();
        return response()->json(['success' => true, 'data' => $orders]);
    }

    public function addDriverCollectedOrders(Request $request) {
        $current_user_id = Auth::user()->id;
        $driverId = $request->get('driver_id');

        $collectionVoucher = new DriverCollectionVoucher();
        $collectionVoucher->oid = $this->createOid();
        $collectionVoucher->driver_id = $request->get('driver_id');
        $collectionVoucher->user_id = $current_user_id;
        $collectionVoucher->notes = $request->get('notes');
        $collectionVoucher->total = $request->get('total');
        $collectionVoucher->not_found_orders = $request->get('not_found_orders');
        $collectionVoucher->save();

        $orders = $request->get('orders');
        foreach($orders as $order) {
            $orderObject =  (object) $order;
            $currentOrder = Order::where('id', $orderObject->id)->first();
            $currentOrder->financial_status = 3;
            $currentOrder->customer_payment = 0;
            $currentOrder->driver_collection_id = $collectionVoucher->id;
            $currentOrder->save();

            DB::insert('insert into collection_orders (driver_collection_voucher_id, order_id) values (?, ?)', [$collectionVoucher->id, $orderObject->id]);
        }

        return response()->json(['success' => true]);
    }

    public function getCustomerCollectedOrders(Request $request) {
        $customerId = $request->get('customer_id');
        $companyId = $request->get('company_id');
        $orders = Order::where('status_id', 6)
                        ->where('customer_id', $customerId)
                        ->where('company_id', $companyId)
                        ->where('financial_status', 3)
                        ->where('customer_payment', "<>", 1)
                        ->with('orderCosts')
                        ->get();
        return response()->json(['success' => true, 'data' => $orders]);
    }

    public function addCustomerPaymentOrders(Request $request) {
        $current_user_id = Auth::user()->id;
        $customerId = $request->get('customer_id');

        $customerPayment = new CustomerPayment();
        $customerPayment->oid = $this->createOid();
        $customerPayment->customer_id = $request->get('customer_id');
        $customerPayment->company_id = $request->get('company_id');
        $customerPayment->user_id = $current_user_id;
        $customerPayment->notes = $request->get('notes');
        $customerPayment->total = $request->get('total');
        $customerPayment->not_found_orders = $request->get('not_found_orders');
        $customerPayment->post = 0;
        $customerPayment->manual_number = $request->get('manual_number');
        $customerPayment->save();

        $orders = $request->get('orders');
        foreach($orders as $order) {
            $orderObject =  (object) $order;
            $currentOrder = Order::where('id', $orderObject->id)->first();
            $currentOrder->customer_payment = 1;
            $currentOrder->save();
            DB::insert('insert into customer_payment_orders (customer_payment_id, order_id) values (?, ?)', [$customerPayment->id, $orderObject->id]);
        }

        $newCustomerPayment = CustomerPayment::where('id', $customerPayment->id)->with('customer')->with('company')
                                            ->with('orders')->with('user')
                                            ->with('orders.to')->with('orders.status')
                                            ->with('orders.orderCosts')
                                            ->with('customer.city')->with('company.city')
                                            ->first();
        return response()->json(['success' => true, 'data' => $newCustomerPayment]);
    }

    public function getCustomerPayments(Request $request) {

        $type = $request->get('type');
        $post = $request->get('post');
        $fromDate = $request->get('from_date');
        $toDate = $request->get('to_date');
        $customer = $request->get('customer_id');
        $company = $request->get('company_id');


        $customerPayment = CustomerPayment::with('customer')->with('company')
                                            ->with('orders')->with('user')
                                            ->with('orders.to')->with('orders.status')
                                            ->with('orders.orderCosts')
                                            ->with('customer.city')->with('company.city')
                                            ->orderBy('created_at', 'DESC');

        if ($type == 1 || $type == 4) { // company
            $customerPayment = $customerPayment->where('company_id', $request->get('company_id'));
        } elseif ($type == 2) { // customer
            $customerPayment = $customerPayment->where('customer_id', $request->get('user_id'));
        }

        if ($post !== 'null') {
            $customerPayment = $customerPayment->where('post', $post);
        }
        if ($fromDate !== 'null') {
            $customerPayment = $customerPayment->whereDate('created_at', '>=', $fromDate);
        }
        if ($toDate !== 'null') {
            $customerPayment = $customerPayment->whereDate('created_at', '<=', $toDate);
        }
        if ($company !== 'null') {
            $customerPayment = $customerPayment->where('company_id', $company);
        }
        if ($customer !== 'null') {
            $customerPayment = $customerPayment->where('customer_id', $customer);
        }

        $customerPayment = $customerPayment->paginate(20);
        return response()->json(['success' => true, 'data' => $customerPayment]);
    }

    public function getDriversCollection(Request $request) {
        $companyId = $request->get('company_id');

        $drivers = Driver::where('company_id', $companyId)->pluck('id')->toArray();
        $driversCollection = DriverCollectionVoucher::whereIn('driver_id', $drivers)
                                            ->with('driver')->with('driver.company')
                                            ->with('orders')->with('user')
                                            ->with('orders.to')->with('orders.status')
                                            ->with('orders.orderCosts')
                                            ->with('driver.company.city')
                                            ->orderBy('created_at', 'DESC');

        $driversCollection = $driversCollection->paginate(20);
        return response()->json(['success' => true, 'data' => $driversCollection]);
    }

    public function loadingOrdersDriver(Request $request) {
        $orders = $request->get('orders');
        $current_user_id = Auth::user()->id;
        foreach($orders as $order) {
            $orderObject =  (object) $order;
            $orderData = Order::where('oid', $orderObject->oid)->first();
            $orderData->driver_id = $request->get('driver_id');
            $orderData->status_id = 5;
            $orderData->save();

            $orderDriver = new OrderDriver();
            $orderDriver->order_id = $request->get('order_id');
            $orderDriver->driver_id = $request->get('driver_id');
            $orderDriver->user_id = $current_user_id;
            $orderDriver->save();
        }
        $ordersObject = Order::whereIn('oid', $orders)
                            ->with('from')->with('to')->with('status')->with('company')
                            ->with('customer')->with('driver')->with('orderCosts')
                            ->get();
        return response()->json(['success' => true, 'data' => $ordersObject]);
    }

    public function addOrderPayment(Request $request) {
        // add Order collection
        $collection = new Collection();
        $collection->order_id = $request->get('order_id');
        $collection->company_id = $request->get('company_id');
        $collection->driver_id = $request->get('driver_id');
        $collection->package_cost = $request->get('package_cost');
        $collection->trans_cost = $request->get('trans_cost');
        $collection->total = $request->get('total');
        $collection->received = $request->get('received');
        $collection->notes = $request->get('notes');
        $collection->save();

        $orderCost = OrderCost::where('order_id', $request->get('order_id'))->first();
        $orderCost->received = $orderCost->received + $request->get('received');
        $orderCost->collection_notes = $request->get('notes');
        if ($orderCost->to_collect == $orderCost->received) {
            $orderCost->collected = 1;
        }
        $orderCost->save();

        if ($orderCost->who_pays == 1) {
            $customerCollection = new CustomerCollection();
            $customerCollection->order_id = $request->get('order_id');
            $customerCollection->company_id = $request->get('company_id');
            $customerCollection->driver_id = $request->get('driver_id');
            $customerCollection->trans_cost = $orderCost->trans_cost;
            $customerCollection->collection_id = $collection->id;
            $customerCollection->save();
        }

        $order = Order::where('id', $request->get('order_id'))->first();
        $order->financial_status = 2;
        $order->save();

        $newOrder = Order::where('id', $request->get('order_id'))
                    ->with('from')->with('to')->with('status')->with('company')->with('customer')->with('driver')->with('orderCosts')
                    ->first();
        return response()->json(['success' => true, 'data' => $newOrder]);
    }

    public function addReceipt(Request $request) {

        $hasManual = Transaction::where('manual_number', $request->get('manual_number'))
                    ->where('company_id', $request->get('company_id'))->count();
        if ($hasManual > 0) {
            return response()->json(['success' => false, 'status' => 'has_manual_number']);
        }
        $transaction = new Transaction();
        $transaction->amount = $request->get('amount');
        $transaction->company_id = $request->get('company_id');
        $transaction->customer_id = $request->get('customer_id');
        $transaction->trans_type = 3;
        $transaction->manual_number = $request->get('manual_number');
        $transaction->save();

        return response()->json(['success' => true]);
    }

    public function addCompanyLogo(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'image' => 'required',
            'company_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'invalid_data']);
        }

        $company = Company::where('id', $request->get('company_id'))->with('city')->first();
        // upload image
        $image = $request->get('image');
        $pos   = strpos($image, ';');
        $type  = explode('/', substr($image, 0, $pos))[1];
        $name  = "image_company_" . $company->id . "_" . date('d-m-Y-h-i-s') . "." . $type;
        $media = "companies/ApiUploads/" . $name;
        $path  = storage_path("app/public/" . $media);
        InterventionImage::make(file_get_contents($image))->save($path);
        // end upload image
        $company->logo = $media;
        $company->save();

        return response()->json(['success' => true, 'data' => $company]);

    }

    public function approveCustomerPayment(Request $request) {
        $customerPayment = CustomerPayment::where('id', $request->get('id'))->first();
        $customerPayment->post = 1;
        $customerPayment->post_date = date('Y-m-d');
        $customerPayment->save();

        $transaction = new Transaction();
        $transaction->amount = $request->get('total');
        $transaction->company_id = $request->get('company_id');
        $transaction->customer_id = $request->get('customer_id');
        $transaction->trans_type = 3;
        $transaction->manual_number = $request->get('oid');
        $transaction->save();

        // update orders
        $orders = $request->get('orders');
        foreach($orders as $order) {
            $orderObject =  (object) $order;
            $orderDetail = Order::where('id', $orderObject->id)->first();
            $orderDetail->financial_status = 4;
            $orderDetail->customer_payment_id = $customerPayment->id;
            $orderDetail->save();
        }

        return response()->json(['success' => true, 'data' => $customerPayment]);
    }

    // ----- reports functions -----
    public function getReportDriver() {
        $company_id = Auth::user()->id;
        $company = Company::where('user_id', $company_id)->first();

        $orders = DB::table('orders')
                    ->select(
                        DB::raw('count(*) as count, driver_id')
                    )
                    ->selectRaw('count(status_id) * ? as price_with_tax', [1.0825])
                    ->where('company_id', $company->id)
                    ->groupBy('driver_id')
                    ->get();

        $results = DB::select('SELECT count(*) as test, driver_id
                                FROM orders
                                GROUP BY driver_id;', ['id' => 1]);

        return response()->json(['success' => true, 'data' => $results]);
    }

    public function getDriverOrdersReport(Request $request)
    {
        $company_id = $request->get('company_id');
        $city = $request->get('city_id');
        $fromDate = $request->get('from_date');
        $toDate = $request->get('to_date');
        $driver = $request->get('driver_id');
        $statusMulti = $request->get('status_multi');
        $financialStatusMulti = $request->get('financial_status_multi');
        $company = Company::where('id', $company_id)->with('city')->first();

        // $orders = Order::where('driver_id', $request->get('driver_id'))->get();

        $orders = Order::where('company_id', $request->get('company_id'))
            ->with('from')->with('to')->with('status')->with('company')
            ->with('customer')->with('driver')->with('orderCosts')
            ->with('orderDetails')->with('orderDetails.packSize')
            ->with('customerPaymentObject')->with('driverCollection')
            ->orderBy('created_at', 'DESC');

        if ($city !== 'null' && $city !== null) {
            $orders = $orders->where('to_id', $city);
        }
        if ($driver !== 'null' && $driver !== null) {
            $orders = $orders->where('driver_id', $driver);
        }else {
            $orders = $orders->whereNotNull('driver_id')->where('driver_id', '<>', '');
        }
        if ($fromDate !== 'null' && $fromDate !== null) {
            $orders = $orders->whereDate('created_at', '>=', $fromDate);
        }
        if ($toDate !== 'null' && $toDate !== null) {
            $orders = $orders->whereDate('created_at', '<=', $toDate);
        }
        if ($statusMulti !== 'null' && $statusMulti !== null) {
            $orders = $orders->whereIn('status_id', $statusMulti);
        }
        if ($financialStatusMulti !== 'null' && $financialStatusMulti !== null) {
            $orders = $orders->whereIn('financial_status', $financialStatusMulti);
        }

        $orders = $orders->get();

        return response()->json(['company' => $company, 'orders' => $orders]);
        // return response()->json(['success' => true, 'data' => ['company' => $company, 'orders' => $orders]]);
    }

    public function getCustomerOrdersReport(Request $request)
    {
        $company_id = $request->get('company_id');
        $city = $request->get('city_id');
        $fromDate = $request->get('from_date');
        $toDate = $request->get('to_date');
        $customer = $request->get('customer_id');
        $statusMulti = $request->get('status_multi');
        $financialStatusMulti = $request->get('financial_status_multi');
        $company = Company::where('id', $company_id)->with('city')->first();

        $orders = Order::where('company_id', $request->get('company_id'))
            ->with('from')->with('to')->with('status')->with('company')
            ->with('customer')->with('driver')->with('orderCosts')
            ->with('orderDetails')->with('orderDetails.packSize')
            ->with('customerPaymentObject')->with('driverCollection')
            ->orderBy('created_at', 'DESC');

        if ($city !== 'null' && $city !== null) {
            $orders = $orders->where('to_id', $city);
        }
        if ($customer !== 'null' && $customer !== null) {
            $orders = $orders->where('customer_id', $customer);
        }else {
            $orders = $orders->whereNotNull('customer_id')->where('customer_id', '<>', '');
        }
        if ($fromDate !== 'null' && $fromDate !== null) {
            $orders = $orders->whereDate('created_at', '>=', $fromDate);
        }
        if ($toDate !== 'null' && $toDate !== null) {
            $orders = $orders->whereDate('created_at', '<=', $toDate);
        }
        if ($statusMulti !== 'null' && $statusMulti !== null) {
            $orders = $orders->whereIn('status_id', $statusMulti);
        }
        if ($financialStatusMulti !== 'null' && $financialStatusMulti !== null) {
            $orders = $orders->whereIn('financial_status', $financialStatusMulti);
        }

        $orders = $orders->get();

        return response()->json(['company' => $company, 'orders' => $orders]);
    }
    // ----- private functions -----
    private function createOid() {
        return strtoupper(substr(md5(uniqid(mt_rand(), true)), 0, 8));
    }
    private function createOidOrder($orderId) {
        return  substr(sprintf('%08d', $orderId), -8);
        // return  'O' . date("y") . date("m") . substr(sprintf('%05d', $orderId), -5);
        //return strtoupper(substr(md5(uniqid(mt_rand(), true)), 0, 8));
    }
    // ----- -------- - - -- - - - - - - -
    private function generateOrderOid() {
        // $number = mt_rand(10000000, 99999999); // better than rand()
        $number = str_pad(mt_rand(1,99999999),8,'0',STR_PAD_LEFT);
        // call the same function if the barcode exists already
        if ($this->orderOidExists($number)) {
            return $this->generateOrderOid();
        }

        // otherwise, it's valid and can be used
        return $number;
    }

    private function orderOidExists($number) {
        // query the database and return a boolean
        // for instance, it might look like this in Laravel
        return Order::where('oid', $number)->exists();
    }
}
