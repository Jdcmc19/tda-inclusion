	<master>


		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">



	<div class="container" ng-app="incursionApp"> 

		
	<div  ng-controller="inclusionController">
		<div id="profile-name">
	        @user_name@
	        <br>
	        @user_carnet@
	    </div>

		<form>
		  <div class="form-group">
		  	<input type="hidden" id="userName" name="userName" value= "@user_name@" ng-model="inclusion.userName">
	 		<input type="hidden" id="userCarnet" name="userCarnet" value= "@user_carnet@" ng-model="comentario.userCarnet">


			<div class="form-group">
	          <label for="sede_select">Seleccione la sede</label>
			<select class="form-control" ng-model="inclusion.sedeSeleccionada" ng-options="sede as sede.nombre_sede for sede in sedeQuery track by sede.id_sede" ng-change="getEscuelas()">
			  <option value="">--Elige opcion--</option>
			</select>
	          <pre> {{ sedeQuery | json }} </pre>
	          <pre> {{ inclusion.sedeSeleccionada }} </pre>
	      </div>

	       
	       <div class="form-group">
	          <label for="escuela_select">Seleccione la Escuela</label>
			<select class="form-control" ng-model="escuelaSeleccionada" ng-options="escuela as escuela.nombre_escuela for escuela in escuelaQuery track by escuela.id_escuela" >
			  <option value="">--Elige opcion--</option>
			</select>
	          <pre> {{ escuelaQuery | json }} </pre>
	          <pre> {{ escuelaSeleccionada }} </pre>
	      </div>


			<label>Escuela</label>
		  	<div class="dropdown">	
			<select class="form-control" id="escuela" name="escuela" ng-model="inclusion.escuela" ng-repeat="escuela in escuelaQuery">
			<option value="{{inclusion.escuelas}}">{{ inclusion.escuela }}</option>
	      	</select>
			</div>
		    

		    <label>Curso</label>
		  	<div class="dropdown">
			<select class="form-control" id="curso" name="curso" ng-model="inclusion.curso" ng-repeat="curso in escuelaQuery">
			<option value="{{inclusion.curso}}">{{ inclusion.curso }}</option>
	      	</select>
			</div>

			<label>Grupo</label>
		  	<div class="dropdown">
			<select class="form-control" id="grupo" name="grupo" ng-model="inclusion.grupo" ng-repeat="grupo in escuelaQuery">
			<option value="{{inclusion.grupo}}">{{ inclusion.grupo }}</option>
	      	</select>
			</div>


		  </div>
		  <button type="submit" class="btn btn-primary" ng-click="enviarInclusion()">Enviar</button>
		</form>    


	</div>

	<div/>





	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>



		<script src="node_modules/angular/angular.min.js"></script>

		<script src="resources/js/inclusion.js"></script>