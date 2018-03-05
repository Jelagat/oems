<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    //
    protected $table = 'payments';

    protected $fillable = ['payment_type','amount','property_id','user_id'];
 
}
