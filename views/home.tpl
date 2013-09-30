
<div style="float:left">
<h1> Under Construction </h1>
<img src="/static/img/tux-under-construction.jpg" style="margin: 0 auto;" />
</div>

<form id="background_job" class="form-horizontal span5" style="float:left">
	<fieldset>
		<legend>Background Job</legend>
 
		<div class="control-group">
			<label class="control-label">Time to run the job: </label>
			<div class="controls row-fluid">				
				<div class="span3" >
					<input id="num_seconds" type="text" value="10" class="input-block-level" 
								maxlength="4" pattern="\d*" title="Number of seconds for job to run" 
								required>
					<label style="clear:both">seconds </label>
				</div>				
			</div>

			<div id="results" style="display:none">
					<label class="control-label">Job Id: </label>
					<div class="controls row-fluid">
						<div class="span12" >
							<label id="job_id"></label>
						</div>
					</div>

					<label class="control-label">Percent Finished: </label>
					<div class="controls row-fluid">
						<div class="span7" >
							<label id="percent_finished"></label>

							<div class="progress progress-striped active">
							  <div id="background_progress_bar" class="bar" style="width:0%;"></div>
							</div>

						</div>
					</div>


					<label class="control-label">Result: </label>
					<div class="controls row-fluid">
						<div class="span7" >
							<label id="result"></label>
						</div>
					</div>

					
			</div>		

		</div>
 

		<div class="form-actions">
			<button id="submit_background_job" type="submit" class="btn btn-primary">Submit</button>
			<button type="button" class="btn">Cancel</button>
		</div>
	</fieldset>
</form>


%def scripts():
	
	 <script>

	 	$(document).ready(function() {


	 		$('#submit_background_job').click(function() {
	 		 	  background_job_url = '/background_job?seconds=' + $('#num_seconds').val();
				  $.get( background_job_url, function( data ) {
				  	task_id = data['id'];
				  	$('#results').show();
				  	$('#job_id').text(data['id']);
				  	$('#percent_finished').text("0% complete");
					$('#background_progress_bar').width("0%");
					$('#result').text('');
					
				  	task_url = '/background_job/' + task_id;

				  	update_progress = function() {
		                $.get(task_url, function(data) {
		                	if(data['progress']) {
		                		$('#percent_finished').text(data['progress'] + "% complete");	
		                		$('#background_progress_bar').width(data['progress'] + "%")
		                	}
		                    
		                    if(data['result']){
		                      $('#percent_finished').text("100% complete");
		                      $('#background_progress_bar').width("100%");
		                      $('#result').text(data['result']);
		                      clearInterval(intervalID);
		                    }          
		                } );     
		             };
		            update_progress();
				  	var intervalID = setInterval(update_progress, 1000); // 1000 milliseconds = 1 second.	

				  });
				  return false;
	 		});
	 		 

	 	})
       

    </script>
	
%end

%rebase layout title="Home", scripts=scripts

