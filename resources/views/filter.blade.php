<div>
    <div class="container"> 
        <div class="row">
            <div class="col-md-12">
                <input type="text" wire:model="searchTerm"
                class="form-control" />
                <br />
                <table class="table table-bordered" style="
                    margin: 10px 0 10px 0;">
                    <tr>
                        <th>Name</th>
                        <th>Symptoms</th>
                    </tr>
                    @foreach($diagnose as $diagnose)
                    <tr>
                        <td>{{ $diagnose->name }}</td>
                        <td>{{ $diagnose->symptoms }}</td>
                    </tr>
                    @endforeach
                </table>
                {{ $diagnose->links() }}
            </div>
        </div>
    </div>
</div>