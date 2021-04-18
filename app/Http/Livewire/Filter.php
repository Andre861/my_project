<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Diagnose;

class Filter extends Component
{
    use WithPagination;

    public $searchTerm;

    public function render()
    {
        //return view('livewire.filter');
        return view('livewire.filter', [
            'diagnoses' => Diagnose::where(function($sub_query)
                {
                $sub_query->where('name', 'like', '%'.$this->searchTerm.'%')
                        ->orWhere('symptoms', 'like', '%'.$this->searchTerm.'%');
                })->paginate(10)

        ]);
    }
}
