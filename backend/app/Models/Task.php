<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    protected $fillable = ['user_id', 'title', 'description', 'due_date', 'location_tags', 'status'];

    protected $dates = ['due_date'];

    /**
     * Get the user that owns the task.
     */
    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function isOverdue()
    {
        return $this->due_date->isPast();
    }

    public function scopeCompleted($query)
    {
        return $query->where('status', 'completed');
    }
}
