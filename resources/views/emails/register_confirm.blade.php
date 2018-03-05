<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<p>HELLO {{$name}},</p>
		 <p>Thanks for joining {{getcong('site_name')}}.</p>
		<p>You can use the below included login details to manage your property alerts on {{getcong('site_name')}}.</p>
		<p>Here is your login ID & password for {{getcong('site_name')}}</p>
		
		<p>Login ID : {{$email}}</p>
		<p>Password :{{$password}}</p>
		
		<p>Please verify your email id by clicking on the following link (or copy it into a browser):</p>
		<p>{!! link_to('auth/confirm/' . $confirmation_code) !!}.<br></p>
	</body>
</html>
 