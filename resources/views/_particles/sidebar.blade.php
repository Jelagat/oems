<div class="col-md-3 col-md-pull-9 sidebar">
            <div class="widget widget-white">
              <div class="widget-header">
                <h3>Advance Search</h3>
              </div>    
               
              {!! Form::open(array('url' => array('searchproperties'),'class'=>'advance-search','name'=>'search_form','id'=>'search_form','role'=>'form')) !!}   
               <div class="form-group">
                      <label for="city">City</label>
                      <select class="form-control" name="city_id">
                        @foreach(\App\City::where('status','1')->orderBy('city_name')->get() as $city)  
						
							<option value="{{$city->id}}">{{$city->city_name}}</option>
										
						@endforeach
                         
                      </select>
                    </div>
                <div class="form-group">
                      <label for="purpose">Purpose</label>
                      <select class="form-control" name="purpose">
                        <option value="Sale">Special Purpose</option>
                        <option value="Rent">General Purpose</option>
                      </select>
               </div>
               <div class="form-group">
                      <label for="type">Type</label>
                      <select class="form-control" name="type">
                       
                        @foreach(\App\Types::orderBy('types')->get() as $type)
                        <option value="{{$type->id}}">{{$type->types}}</option>
						@endforeach
						 
                      </select>
              </div>
                 
                <div class="form-group">
                      <label for="minprice">Min Price</label>
                      <input type="text" name="min_price" class="form-control" placeholder="Min Price (number)"> 
                </div>
                <div class="form-group">
                      <label for="maxprice">Max Price</label>
                      <input type="text" name="max_price" class="form-control" placeholder="Max Price (number)"> 
                    </div>
                
                <input type="submit" name="submit" value="Search" class="btn btn-primary btn-block">
              {!! Form::close() !!}
            </div>
            <!-- break -->
            <div class="widget widget-sidebar widget-white">
              <div class="widget-header">
                <h3>Property Type</h3>
              </div>    
              <ul class="list-check">
                @foreach(\App\Types::orderBy('types')->get() as $type)  
                
                <li><a href="{{URL::to('type/'.$type->slug.'')}}">{{$type->types}}</a>&nbsp;({{countPropertyType($type->id)}})</li>
                
                @endforeach
                 
                                
              </ul>
            </div>
            
            <!-- break -->
          </div>