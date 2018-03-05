@extends("admin.admin_app")

@section("content")

<div id="main">
	
	@if (count($errors) > 0)
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
	@endif
	 @if(Session::has('flash_message'))
				    <div class="alert alert-success">
				    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
<span aria-hidden="true">&times;</span></button>
				        {{ Session::get('flash_message') }}
				    </div>
	@endif
   
   	<div class="panel panel-default">
            <div class="panel-body">

            <p>Go To Safaricom Menu </p>
            <p>Select M-Pesa </p>
            <p>Select lipa na M-Pesa</p>
            <p>Select Paybill</p>
            <p>Select "Enter Business Number"</p>
            <p>Enter "00000", Click OK</p>
            <p>Select "Enter Account Number"</p>
            <p>Enter Invoice Number and Click OK</p>
            <p>Input Ammount and Click OK</p>
            <p>Enter your PIN number and Click OK</p>
            <p>Confirm by Clicking OK</p>

                {!! Form::open(array('url' => array('admin/confirmation'),'class'=>'form-horizontal padding-15','name'=>'confirm_form','id'=>'confirm_form','role'=>'form','enctype' => 'multipart/form-data')) !!} 
                
                <div class="form-group">
                    <label for="" class="col-sm-3 control-label">Confirmation Code</label>
                      <div class="col-sm-9">
                        <input type="text" name="city_name" value="{{ isset($city->city_name) ? $city->city_name : null }}" class="form-control">
                    </div>
                </div>
                 
                <hr>
                <div class="form-group">
                    <div class="col-md-offset-3 col-sm-9 ">
                    	<button type="submit" class="btn btn-primary">Submit</button>
                         
                    </div>
                </div>
                
                {!! Form::close() !!} 
            </div>
        </div>
   
    
</div>

@endsection