<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DATA INSERT</title>

<style type="text/css">
<
style type ="text /css ">body {
	font-family: Verdana;
	margin: 0;
	padding: 0;
	height: 100vh; /* Increased height */
}

input[type=text], select, textarea {
	width: 80%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	resize: vertical;
}

/* Style the label to display next to the inputs */
label {
	padding: 12px 12px 12px 0px;
	display: inline-block;
}

/* Style the submit button */
input[type=submit] {
	background-color: #04AA6D;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: right;
	margin-top: 10px;
}

.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
	margin: 0% 10%;
}

/* Floating column for labels: 25% width */
.col-25 {
	float: left;
	width: 50%;
	margin-top: 6px;
}

/* Floating column for inputs: 75% width */
.col-75 {
	float: left;
	width: 100%;
	margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
	.col-25, .col-75, input[type=submit] {
		width: 100%;
		margin-top: 0;
	}
}
</style>


</head>
<body>



	<%
	String syrName = request.getParameter("surveyorName");
	String prjName = request.getParameter("project");
	String inputDate = request.getParameter("inputDate");
	String dept = request.getParameter("dept");
	%>


	<%
	if (dept.contains("sm_01")) {
	%>
	<!-- code -->
	<h1>OOPS !! YOU DONT HAVE PERMISSION TO FILL THE FORM</h1>
	<%
	}
	%>



	<!-- Operation Team -->
	<%
	if (dept.contains("sm_02")) {
	%>
	<div class="container">
		<div>
			<div class="title">
				<h1>Operation Team</h1>
			</div>
		</div>
		<form action="#">
			<div class="row">
				<div class="col-25">
					<label for="lateStart">Late Start</label>
				</div>
				<div class="col-75">
					<select id="lateStart" name="lateStart">
						<option value="nil">-</option>
						<option value="YES">YES</option>
						<option value="NO">NO</option>		

					</select>
				</div>
			</div>
			
			<div class="row">
				<div class="col-25">
					<label for="personalReason">Personal Reason </label>
				</div>
<!-- 				<div class="col-75">
					<input type="text" id="personalReason" name="personalReason"
						placeholder="Personal Reason....">
				</div> -->
				<div class="col-75">
					<select id="personalReason" name="personalReason">
						<option value="nil">-</option>
						<option value="YES">YES</option>
						<option value="NO">NO</option>						

					</select>
				</div>
			</div>
			
			<div class="row">
				<div class="col-25">
					<label for="disciplinaryIssue">Disciplinary Issue</label>
				</div>
<!-- 				<div class="col-75">
					<input type="text" id="disciplinaryIssue" name="disciplinaryIssue"
						placeholder="Disciplinary Issue....">
					</div> -->
					
				<div class="col-75">
					<select id="disciplinaryIssue" name="disciplinaryIssue">
						<option value="nil">-</option>
						<option value="YES">YES</option>
						<option value="NO">NO</option>				
					</select>
				</div>				
			</div>
			
			<div class="row">
				<div class="col-25">
					<label for="opsOther">Other</label>
				</div>
				<div class="col-75">
					<input type="text" id="opsOther" name="opsOther"
						placeholder="Other....">
				</div> 
			</div>

			<div class="row">
				<input type="submit" value="Submit">
			</div>
		</form>
	</div>
	<%
	}
	%>






	<!-- DA -->
	<%
	if (dept.contains("sm_03")) {
	%>
	<div class="container">
		<div>
			<div class="title">
				<h1>Data Analytics Team</h1>
			</div>
		</div>

		<form action="#">


			<div class="row">
				<div class="col-25">
					<label for="HighDontKnow">High Don't Know</label>
				</div>				
				<div class="col-75">
					<select id="highdontknow" name="highdontknow">
						<option value="nil">-</option>
						<option value="YES">YES</option>
						<option value="NO">NO</option>		
					</select>
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="samplingNotCovered">Sampling Not Covered</label>
				</div>
				<div class="col-75">
					<select id="samplingNotCovered" name="samplingNotCovered">
						<option value="nil">-</option>
						<option value="YES">YES</option>
						<option value="NO">NO</option>			
					</select>
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="dataManipulation">Data Manipulation</label>
				</div>
				<div class="col-75">
					<select id="dataManipulation" name="dataManipulation">
						<option value="nil">-</option>
						<option value="YES">YES</option>
						<option value="NO">NO</option>			
					</select>
				</div>
			</div>
			
			
			
			<div class="row">
				<div class="col-25">
					<label for="daOther">Other</label>
				</div>
				<div class="col-75">
					<input type="text" id="daOther" name="daOther"
						placeholder="Other....">
				</div> 
			</div>

			<div class="row">
				<input type="submit" value="Submit">
			</div>
		</form>
	</div>
	<%
	}
	%>









	<!-- Quality Team -->
	<%
	if (dept.contains("sm_04")) {
	%>
	<div class="container">
		<div>
			<div class="title">
				<h1>Quality Team</h1>
			</div>
		</div>

		<form action="#">
			<div class="row">
				<div class="col-25">
					<label for="VariationinData">Variation in Data</label>
				</div>
				
				<div class="col-75">
					<select id="VariationinData" name="VariationinData">
						<option value="nil">-</option>
						<option value="YES">YES</option>
						<option value="NO">NO</option>			
					</select>
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="NoPoorRecording">No/ Poor Recording</label>
				</div>
				<div class="col-75">
					<select id="NoPoorRecording" name="NoPoorRecording">
						<option value="nil">-</option>
						<option value="YES">YES</option>
						<option value="NO">NO</option>					
					</select>
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="skippingOfQuestions">Skipping of Questions</label>
				</div>
				<div class="col-75">
					<select id="NoPoorRecording" name="NoPoorRecording">
						<option value="nil">-</option>
						<option value="YES">YES</option>
						<option value="NO">NO</option>				
					</select>
				</div>
			</div>


			<div class="row">
				<div class="col-25">
					<label for="invalidInterview">Invalid Interview</label>
				</div>
				
				<div class="col-75">
					<select id="invalidInterview" name="invalidInterview">
						<option value="nil">-</option>
						<option value="YES">YES</option>
						<option value="NO">NO</option>				
					</select>
				</div>
			</div>
			
			
			<div class="row">
				<div class="col-25">
					<label for="qaOther">Other</label>
				</div>
				<div class="col-75">
					<input type="text" id="qaOther" name="qaOther"
						placeholder="Other....">
				</div> 
			</div>


			<div class="row">
				<input type="submit" value="Submit">
			</div>
		</form>
	</div>
	<%
	}
	%>






	<%
	if (dept.contains("sm_05")) {
	%>
	<!-- code -->
	<h1>OOPS !! YOU DONT HAVE PERMISSION TO FILL THE FORM</h1>
	<%
	}
	%>





	<!-- Marketing Research Team -->
	<%
	if (dept.contains("sm_06")) {
	%>
	<div class="container">
		<div>
			<div class="title">
				<h1>Marketing Research Team</h1>
			</div>
		</div>

		<form action="#">
			<div class="row">
				<div class="col-25">
					<label for="TeamsReport">MS Teams Report not sent on
						time</label>
				</div>
				<div class="col-75">
					<select id="TeamsReport" name="TeamsReport">
						<option value="nil">-</option>
						<option value="YES">YES</option>
						<option value="NO">NO</option>				
					</select>
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="ShortPolitical">Short Political & Local
						Issue</label>
				</div>
				<div class="col-75">
					<select id="ShortPolitical" name="ShortPolitical">
						<option value="nil">-</option>
						<option value="YES">YES</option>
						<option value="NO">NO</option>				
					</select>
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="PositiveFeedback">Positive Feedback</label>
				</div>
				<div class="col-75">
					<select id="positiveFeedback" name="positiveFeedback">
						<option value="nil">-</option>
						<option value="YES">YES</option>
						<option value="NO">NO</option>					
					</select>
				</div>
			</div>
			
			
			
			<div class="row">
				<div class="col-25">
					<label for="MRTOther">Other</label>
				</div>
				<div class="col-75">
					<input type="text" id="MRTOther" name="MRTOther"
						placeholder="Other....">
				</div> 
			</div>


			<div class="row">
				<input type="submit" value="Submit">
			</div>
		</form>
	</div>

	<%
	}
	%>



	<!-- 	Accounts Team -->
	<%
	if (dept.contains("sm_07")) {
	%>
	<div class="container">
		<div>
			<div class="title">
				<h1>Accounts Team</h1>
			</div>
		</div>

		<form action="#">


			<div class="row">
				<div class="col-25">
					<label for="disciplinaryIssue">Delay in submission of
						Invoice (FR)</label>
				</div>
				<div class="col-75">
					<input type="text" id="disciplinaryIssue" name="disciplinaryIssue"
						placeholder="Type Here....">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="disciplinaryIssue">Delay in submission of
						Vouchers (FR)/ Travel Claim (FR)</label>
				</div>
				<div class="col-75">
					<input type="text" id="disciplinaryIssue" name="disciplinaryIssue"
						placeholder="Type Here....">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="disciplinaryIssue">Incorrect/ Improper exp
						submission in vouchers</label>
				</div>
				<div class="col-75">
					<input type="text" id="disciplinaryIssue" name="disciplinaryIssue"
						placeholder="Type Here....">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="disciplinaryIssue">Irregularity in daily
						expense reporting in teams</label>
				</div>
				<div class="col-75">
					<input type="text" id="disciplinaryIssue" name="disciplinaryIssue"
						placeholder="Type Here....">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="disciplinaryIssue">Activity end cash in hand
						not received</label>
				</div>
				<div class="col-75">
					<input type="text" id="disciplinaryIssue" name="disciplinaryIssue"
						placeholder="Type Here....">
				</div>
			</div>
			
			
			
			
			<div class="row">
				<div class="col-25">
					<label for="AccountOther">Other</label>
				</div>
				<div class="col-75">
					<input type="text" id="AccountOther" name="AccountOther"
						placeholder="Other....">
				</div> 
			</div>


			<div class="row">
				<input type="submit" value="Submit">
			</div>
		</form>
	</div>

	<%
	}
	%>




	<!-- HR Analytics -->
	<%
	if (dept.contains("sm_08")) {
	%>
	<div class="container">
		
		<div>
			<div class="title">
				<h1>HR Analytics</h1>
			</div>
		</div>

		<form action="#">
			<div class="row">
				<div class="col-25">
					<label for="giftProvided">Surveyor Said - Gift
						Provided</label>
				</div>
				<div class="col-75">
					<input type="number" id="giftProvided" name="giftProvided"
						placeholder="Type Here....">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="giftReceived">Respondent Said - Gift
						Received</label>
				</div>
				<div class="col-75">
					<input type="text" id="giftReceived" name="giftReceived"
						placeholder="Type Here...." >
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="giftNotReceived">Respondent Said - Gift Not
						Received</label>
				</div>
				<div class="col-75">
					<input type="text" id="giftNotReceived" name="giftNotReceived"
						placeholder="Type Here....">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="notContactable">Respondent - Not Contactable</label>
				</div>
				<div class="col-75">
					<input type="text" id="notContactable" name="notContactable"
						placeholder="Type Here...." >
				</div>
			</div>
			
			
			
			<div class="row">
				<div class="col-25">
					<label for="hrAOther">Other</label>
				</div>
				<div class="col-75">
					<input type="text" id="hrAOther" name="hrAOther"
						placeholder="Other....">
				</div> 
			</div>
			
			

			<div class="row">
				<input type="submit" value="Submit">
			</div>
		</form>
	</div>

	<%
	}
	%>


	<%
	if (dept.contains("sm_09")) {
	%>
	<!-- code -->
	<h1>OOPS !! YOU DONT HAVE PERMISSION TO FILL THE FORM</h1>
	<%
	}
	%>


	<%
	if (dept.contains("sm_10")) {
	%>
	<!-- code -->
	<h1>OOPS !! YOU DONT HAVE PERMISSION TO FILL THE FORM</h1>
	<%
	}
	%>








<!-- Rajasthan VS Pre Election Study BP
Rajasthan VS Pre Election Study FP -->





</body>
</html>