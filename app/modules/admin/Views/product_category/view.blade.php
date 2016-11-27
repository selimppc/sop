
        <div class="modal-header">
            <h4 class="modal-title">View Of Category : <strong>{{ isset($data->title)?ucfirst($data->title):'' }}</strong></h4>
        </div>
        <div class="modal-body">
            <table class="table table-bordered table-hover table-striped">
                <tr>
                    <th>Category Title/Name</th>
                    <td>{{isset($data->title)?ucfirst($data->title):''}}</td>
                </tr>
                <tr>
                    <th>Category description</th>
                    <td>{{isset($data->description)?ucfirst($data->description):''}}</td>
                </tr>
                <tr>
                    <th>Status</th>
                    <td>{{isset($data->status)?ucfirst($data->status):''}}</td>
                </tr>

            </table>
        </div>

        <div class="modal-footer">
            <a href="{{ URL::previous()}}" class="btn btn-success" type="button"> Close </a>
        </div>

