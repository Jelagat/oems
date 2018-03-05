@extends("app")

@section('head_title', 'Login | '.getcong('site_name') )
@section('head_url', Request::url())

@section("content")
<!-- begin:header -->
    <div id="header" class="heading" style="background-image: url({{ URL::asset('assets/img/img01.jpg') }});">
      <div class="container">
        <div class="row">
          <div class="col-md-10 col-md-offset-1 col-sm-12">
            <div class="page-title">
              <h2>Sign in</p>
            </div>
            <ol class="breadcrumb">
              <li><a href="{{ URL::to('/') }}">Home</a></li>
              <li class="active">Sign in</li>
            </ol>
          </div>
        </div>
      </div>
    </div>
    <!-- end:header -->
<!-- begin:content -->
    <div id="content">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-md-offset-1">
            <div class="blog-container">
              <div class="blog-content" style="padding-top:0px;">
                  <div class="blog-title">
                  <h3>Access to your account</h3>
                   
                </div>

                <div class="blog-text contact" style="margin-top: -40px;">
                  <div class="row">
                  
                  	@if(Session::has('flash_message'))
				    <div class="alert alert-success">
				    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
<span aria-hidden="true">&times;</span></button>
				        {{ Session::get('flash_message') }}
				    </div>
				@endif
                    	<div class="message">
												<!--{!! Html::ul($errors->all(), array('class'=>'alert alert-danger errors')) !!}-->
							                    	@if (count($errors) > 0)
											    <div class="alert alert-danger">
											    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span></button>
											        <ul>
											            @foreach ($errors->all() as $error)
											                <li>{{ $error }}</li>
											            @endforeach
											        </ul>
											    </div>
											@endif
							                    	
							                    </div>
                    <div class="col-md-8 col-sm-7">
                      {!! Form::open(array('url' => 'login','class'=>'','id'=>'loginform','role'=>'form')) !!}
                         <div class="form-group">
                            <label for="email">Email address</label>
                            <input type="email" class="form-control" name="email" id="email" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                        </div>
                         
                         
                        <div class="checkbox">
		                <label>
		                  <input type="checkbox" name="remember" id="checkbox1" /> Remember Me
		                </label>
		              </div>
                         
                        <div class="form-group">
                          <button type="submit" name="submit" class="btn btn-warning"><i class="fa fa-unlock-alt"></i> Sign in</button>
                        </div>
                      {!! Form::close() !!}  
                      
                      <div class="form-group checkbox">                            
                              <p>Don't have account ? <a href="{{ URL::to('register') }}">Sign up here.</a>                <br/>  
                             <a href="{{ URL::to('admin/password/email') }}">Forgot password?</a></p>
                        </div>
                    </div>
                   
                  </div>
                </div>


               		 
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end:content -->
 
@endsection
