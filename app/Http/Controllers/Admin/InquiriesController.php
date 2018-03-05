<?php

namespace App\Http\Controllers\Admin;

use Auth;
use App\User;
use App\Enquire;
use App\Payment;
use App\Properties;
use Carbon\Carbon;
use App\Http\Requests;
use Illuminate\Http\Request;
use Session;
use Intervention\Image\Facades\Image; 
use Illuminate\Support\Facades\DB;

class InquiriesController extends MainAdminController
{
	public function __construct()
    {
		 $this->middleware('auth');	
		
		 parent::__construct();
         
    }
    public function inquirieslist()
    {  
    	if(Auth::User()->usertype!="Admin") 
    	{
    		$user_id=Auth::user()->id;
    		
			$inquirieslist = Enquire::where('agent_id',$user_id)->orderBy('id')->get();
		}
		else
		{
			$inquirieslist = Enquire::orderBy('id')->get();
		}
    	
		  
        return view('admin.pages.inquiries',compact('inquirieslist'));
    } 
	 public function paymentlist()
    {  
        if(Auth::User()->usertype=="Client") 
        {
            $user_id=Auth::user()->id;
            
            $paymentlist = Payment::where('user_id',$user_id)->orderBy('id')->get();
        }
        else
        {

            $user_id=Auth::user()->id;
            
            $paymentlist = Properties::where('user_id',$user_id)->orderBy('id')->get();
            //$inquirieslist = Enquire::orderBy('id')->get();
    }
        
          
        return view('admin.pages.payments',compact('paymentlist'));
    }  

    public function confirmation()
    {  
        if(Auth::User()->usertype=="Client") 
        {
            return view('admin.pages.confirmation');
        }
        else
        {
            //$inquirieslist = Enquire::orderBy('id')->get();
    }
        
          
        
    }  

    public function postconfirmation()
    {  
        if(Auth::User()->usertype=="Client") 
        {
            \Session::flash('flash_message', 'Booked Successfully');

            return redirect('admin/dashboard');
        }
        else
        {
            //$inquirieslist = Enquire::orderBy('id')->get();
    }
        
          
        
    }  
    
    public function delete($id)
    {
    	 
        $inquire = Enquire::findOrFail($id);
         
		 
		$inquire->delete();
		
        \Session::flash('flash_message', 'Deleted');

        return redirect()->back();

    }
      
    	
}
