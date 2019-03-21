<master>


	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">




	<!--	<link rel="stylesheet" href="resources/css/profesor.css"> 	-->



	<div class="container" ng-app="incursionApp">

	<div ng-controller="formController">

		<form >
			<div class="form-group">
				<label for="exampleInputEmail1">Nombre</label>
				<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter name" ng-model="form.name">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Password</label>
				<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" ng-model="form.password">
			</div>
			<button type="submit" class="btn btn-primary" ng-click="addInfo()">Submit</button>
		</form>

		  <table id="training_table" class="table">
		    <thead>
		      <tr>
		        <th scope="col">id</th>
		        <th scope="col">name</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr ng-repeat="elementoTMP in result_query">
		        <td>{{ elementoTMP.dependency_id }}</td>
		        <td>{{ elementoTMP.name }}</td>
		      </tr>
		    </tbody>
		  </table>
		
	</div>
		
	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>



	<script src="node_modules/angular/angular.min.js"></script>
	


	<script src="resources/js/profesor.js"></script>
