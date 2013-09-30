
<h1>Users</h1>

<table class="table table-bordered table-striped table-hover">
<thead>
  <tr>
    <th>#</th>
    <th>User</th>
  </tr>
</thead>
<tbody>


%for index, user in enumerate(users):
  <tr>
  	<td>{{index}}</td>
    <td>{{user}}</td>
  </tr>

%end

</tbody>
</table>

%rebase dashboard
