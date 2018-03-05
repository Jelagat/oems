@extends("admin.admin_app")

@section("content")
<div id="main">
	<div class="page-header">
		 
		<h2>Payments</h2>
	</div>
	@if(Session::has('flash_message'))
				    <div class="alert alert-success">
				    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
<span aria-hidden="true">&times;</span></button>
				        {{ Session::get('flash_message') }}
				    </div>
	@endif
     
<div class="panel panel-default panel-shadow">
    <div class="panel-body">
          @if(Auth::user()->usertype=='Client')
        <table id="data-table" class="table table-striped table-hover dt-responsive" cellspacing="0" width="100%">
            <thead>
	            <tr>
	                <th>Property ID</th>
	                <th>Amount</th>
	                <th>Payment Type</th>
                    <th>Transaction Reference</th>
	                 
	                {{--  <th class="text-center width-100">Action</th>  --}}
	            </tr>
            </thead>

            <tbody>
            @foreach($paymentlist as $i => $payments)
         	   <tr>
            	 
                <td>{{ $payments->property_id }}</td>
                <td>{{ $payments->amount }}</td>
                <td>{{ $payments->payment_type }}</td>
                <td>{{ $payments->transaction_reference }}</td>
              
                
                
                
                {{--  <td class="text-center">
                	<a href="{{ url('admin/inquiries/delete/'.$inquiries->id) }}" class="btn btn-default btn-rounded"><i class="md md-delete"></i></a>
                
                
            </td>  --}}
                
            </tr>
           @endforeach
             
            </tbody>
        </table>

        @else
<table id="data-table" class="table table-striped table-hover dt-responsive" cellspacing="0" width="100%">
            <thead>
	            <tr>
	                <th>Property ID</th>
	                <th>Amount</th>
	                
	                 
	                {{--  <th class="text-center width-100">Action</th>  --}}
	            </tr>
            </thead>

            <tbody>
            @foreach($paymentlist as $i => $payments)
         	   <tr>
            	 
                <td>{{ $payments->id }}</td>
                <td>{{ $payments->rent_price }}</td>
                
              
                
                
                
                {{--  <td class="text-center">
                	<a href="{{ url('admin/inquiries/delete/'.$inquiries->id) }}" class="btn btn-default btn-rounded"><i class="md md-delete"></i></a>
                
                
            </td>  --}}
                
            </tr>
           @endforeach
             
            </tbody>
        </table>

        	@endif

    </div>
    <div class="clearfix"></div>
</div>

</div>



@endsection