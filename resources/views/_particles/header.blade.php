<!-- begin:navbar -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
            
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-top">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="{{ URL::to('/') }}" style="padding-right: 0px;">
          
          @if(getcong('site_logo')) <img src="{{ URL::asset('upload/'.getcong('site_logo')) }}" alt=""> @else {{getcong('site_name')}} @endif
          
          </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-top">
          <ul class="nav navbar-nav navbar-right">
            <li class="{{classActivePathPublic('')}}"><a href="{{ URL::to('/') }}">Home</a></li>
        	<li class="{{classActivePathPublic('properties')}}"><a href="{{ URL::to('properties/') }}">All Venues</a></li> 
            
            <li class="{{classActivePathPublic('sale')}}"><a href="{{ URL::to('sale/') }}">Special</a></li>
            <li class="{{classActivePathPublic('rent')}}"><a href="{{ URL::to('rent/') }}">General</a></li>
            <li class="{{classActivePathPublic('agents')}}"><a href="{{ URL::to('agents/') }}">Agents</a></li>
            
             @if(Auth::check())
             
             <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Manage <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="{{ URL::to('admin/dashboard/') }}">Dashboard</a></li>
                <li><a href="{{ URL::to('admin/profile/') }}">Profile</a></li>
                <li><a href="{{ URL::to('logout') }}">Logout</a></li>
                 
              </ul>
            </li>
            @if(Auth::user()->usertype == 'Client')
            
              @else
 
             	<li><a href="{{ URL::to('admin/properties/addproperty') }}" class="signup">Add Venue</a></li>
              @endif
             @else
             	<li><a href="{{ URL::to('login') }}" class="signin">Sign in</a></li>
            	<li><a href="{{ URL::to('register') }}" class="">Sign up</a></li>
            	<li><a href="{{ URL::to('login') }}" class="signup">Add Venue</a></li>
             @endif
             

          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container -->
    </nav>
   <!-- end:navbar -->