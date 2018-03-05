@extends("admin.admin_app")

@section("content")
<div id="main">
	<div class="page-header">

	@if(Auth::user()->usertype=='Owner')
		<div class="pull-right">
			<a href="{{URL::to('admin/properties/addproperty')}}" class="btn btn-primary">Add Venue <i class="fa fa-plus"></i></a>
		</div>
		@elseif(Auth::user()->usertype=='Admin')
		<div class="pull-right">
			<a href="{{URL::to('admin/properties/addproperty')}}" class="btn btn-primary">Add Venue <i class="fa fa-plus"></i></a>
		</div>
		@else

		@endif
		<h2>Venues</h2>
	</div>
	@if(Session::has('flash_message'))
				    <div class="alert alert-success">
				    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
<span aria-hidden="true">&times;</span></button>
				        {{ Session::get('flash_message') }}
				    </div>
	@endif

	@if(Session::has('flash_message_error'))
				    <div class="alert alert-danger">
				    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
<span aria-hidden="true">&times;</span></button>
				        {{ Session::get('flash_message_error') }}
				    </div>
	@endif
     
<div class="panel panel-default panel-shadow">
    <div class="panel-body">
         @if(Auth::user()->usertype=='Owner')
        <table id="data-table" class="table table-striped table-hover dt-responsive" cellspacing="0" width="100%">

            <thead>
	            <tr>
	                <th>Property ID</th>
	                <th>Agent</th>
	                <th>Property Name</th>
					<th>Type</th>
					<th>Purpose</th>
					<th>Booked by</th>
					<th>Date booked</th>
			
	                <th class="text-center">Status</th> 
	                <th class="text-center width-100">Action</th>
	            </tr>
            </thead>

            <tbody>
            @foreach($propertieslist as $i => $property)
         	   <tr>
            	
				<td>{{ $property->id }}</td>
				<td>{{ getUserInfo($property->user_id)->name }}</td> 
                <td>{{ $property->property_name }}</td>
				<td>{{ getPropertyTypeName($property->property_type)->types }}</td>
				<td>{{ $property->property_purpose }}</td>

			

				@if($property->contract_status==1)

				<td>{{ getUserInfo($property->client_id)->name }}</td>
				@else
				<td>Not Booked</td>
				@endif

				<td>{{ $property->eventdate }}</td>


				


				<td class="text-center">
						@if($property->status==1)
							<span class="icon-circle bg-green">
								<i class="md md-check"></i>
							</span>
						@else
							<span class="icon-circle bg-orange">
								<i class="md md-close"></i>
							</span>
						@endif
            	</td>  
                <td class="text-center">
                <div class="btn-group">
								<button type="button" class="btn btn-default-dark dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									Actions <span class="caret"></span>
								</button>
								<ul class="dropdown-menu dropdown-menu-right" role="menu"> 
								@if(Auth::user()->usertype=='Admin')  
									<li><a href="{{ url('admin/properties/addproperty/'.$property->id) }}"><i class="md md-edit"></i> Edit Editor</a></li>
								@endif										 
									
									<li>
									@if(Auth::user()->usertype=='Admin' || Auth::user()->usertype=='Owners')    
										@if($property->status==1)                	
					                	<a href="{{ url('admin/properties/status/'.$property->id) }}"><i class="md md-close"></i> Unpublish</a>
					                	@else
					                	<a href="{{ url('admin/properties/status/'.$property->id) }}"><i class="md md-check"></i> Publish</a>
					                	@endif
									@endif
									</li>
									@if(Auth::user()->usertype=='Admin') 
									<li><a href="{{ url('admin/properties/delete/'.$property->id) }}" onclick="return confirm('Are you sure? You will not be able to recover this.')"><i class="md md-delete"></i> Delete</a></li>
									@endif
								</ul>
							</div> 
                
            </td>
                
            </tr>
           @endforeach
             
            </tbody>
        </table>

        @elseif(Auth::user()->usertype=='Admin')

         <table id="data-table" class="table table-striped table-hover dt-responsive" cellspacing="0" width="100%">

            <thead>
	            <tr>
	                <th>Property ID</th>
	                <th>Agent</th>
	                <th>Property Name</th>
					<th>Type</th>
					<th>Purpose</th>
					<th>Booked by</th>
					<th>Date booked</th>
			
	                <th class="text-center">Status</th> 
	                <th class="text-center width-100">Action</th>
	            </tr>
            </thead>

            <tbody>
            @foreach($propertieslist as $i => $property)
         	   <tr>
            	
				<td>{{ $property->id }}</td>
				<td>{{ getUserInfo($property->user_id)->name }}</td> 
                <td>{{ $property->property_name }}</td>
				<td>{{ getPropertyTypeName($property->property_type)->types }}</td>
				<td>{{ $property->property_purpose }}</td>

			

				@if($property->contract_status==1)

				<td>{{ getUserInfo($property->client_id)->name }}</td>
				@else
				<td>Not Booked</td>
				@endif

				<td>{{ $property->eventdate }}</td>


				


				<td class="text-center">
						@if($property->status==1)
							<span class="icon-circle bg-green">
								<i class="md md-check"></i>
							</span>
						@else
							<span class="icon-circle bg-orange">
								<i class="md md-close"></i>
							</span>
						@endif
            	</td>  
                <td class="text-center">
                <div class="btn-group">
								<button type="button" class="btn btn-default-dark dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									Actions <span class="caret"></span>
								</button>
								<ul class="dropdown-menu dropdown-menu-right" role="menu"> 
								@if(Auth::user()->usertype=='Admin')  
									<li><a href="{{ url('admin/properties/addproperty/'.$property->id) }}"><i class="md md-edit"></i> Edit Editor</a></li>
								@endif										 
									
									<li>
									@if(Auth::user()->usertype=='Admin' || Auth::user()->usertype=='Owners')    
										@if($property->status==1)                	
					                	<a href="{{ url('admin/properties/status/'.$property->id) }}"><i class="md md-close"></i> Unpublish</a>
					                	@else
					                	<a href="{{ url('admin/properties/status/'.$property->id) }}"><i class="md md-check"></i> Publish</a>
					                	@endif
									@endif
									</li>
									@if(Auth::user()->usertype=='Admin') 
									<li><a href="{{ url('admin/properties/delete/'.$property->id) }}" onclick="return confirm('Are you sure? You will not be able to recover this.')"><i class="md md-delete"></i> Delete</a></li>

									<li><a href="{{ url('admin/properties/cancelbooking/'.$property->id) }}" onclick="return confirm('Are you sure? You will not be able to recover this.')"><i class="md md-close"></i> Cancel Booking</a></li>
									@endif
								</ul>
							</div> 
                
            </td>
                
            </tr>
           @endforeach
             
            </tbody>
        </table>
       
       @else

        <table id="data-table" class="table table-striped table-hover dt-responsive" cellspacing="0" width="100%">

            <thead>
	            <tr>
	                <th>Property ID</th>
	                <th>Agent</th>
	                <th>Property Name</th>
					<th>Type</th>
					<th>Purpose</th>
					<!-- <th>Booked by</th> -->
					<th>Date booked</th>
			
	                <th class="text-center">Status</th> 
	                <th class="text-center width-100">Action</th>
	            </tr>
            </thead>

            <tbody>
            @foreach($propertieslist as $i => $property)
         	   <tr>
            	
				<td>{{ $property->id }}</td>
				<td>{{ getUserInfo($property->user_id)->name }}</td> 
                <td>{{ $property->property_name }}</td>
				<td>{{ getPropertyTypeName($property->property_type)->types }}</td>
				<td>{{ $property->property_purpose }}</td>

			

				<!-- @if($property->contract_status==1)

				<td>{{ getUserInfo($property->client_id)->name }}</td>
				@else
				<td>Not Booked</td>
				@endif -->

				<td>{{ $property->eventdate }}</td>


				


				<td class="text-center">
						@if($property->status==1)
							<span class="icon-circle bg-green">
								<i class="md md-check"></i>
							</span>
						@else
							<span class="icon-circle bg-orange">
								<i class="md md-close"></i>
							</span>
						@endif
            	</td>  
                <td class="text-center">
                <div class="btn-group">
								<button type="button" class="btn btn-default-dark dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									Actions <span class="caret"></span>
								</button>
								<ul class="dropdown-menu dropdown-menu-right" role="menu"> 
								@if(Auth::user()->usertype=='Admin')  
									<li><a href="{{ url('admin/properties/addproperty/'.$property->id) }}"><i class="md md-edit"></i> Edit Editor</a></li>
								@endif										 
									
									<li>
									@if(Auth::user()->usertype=='Admin' || Auth::user()->usertype=='Owners')    
										@if($property->status==1)                	
					                	<a href="{{ url('admin/properties/status/'.$property->id) }}"><i class="md md-close"></i> Unpublish</a>
					                	@else
					                	<a href="{{ url('admin/properties/status/'.$property->id) }}"><i class="md md-check"></i> Publish</a>
					                	@endif
									@endif
									</li>
									@if(Auth::user()->usertype=='Admin') 
									<li><a href="{{ url('admin/properties/delete/'.$property->id) }}" onclick="return confirm('Are you sure? You will not be able to recover this.')"><i class="md md-delete"></i> Delete</a></li>
									@endif
								</ul>
							</div> 
                
            </td>
                
            </tr>
           @endforeach
             
            </tbody>
            @endif
        </table>



    </div>
    <div class="clearfix"></div>
</div>

</div>



@endsection