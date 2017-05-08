<members>
	<h5><img src={ userPhotoURL }>
		Hi! { user.displayName }</h5>

	<br>
	<br>
	<post-editor></post-editor>

	<!-- <h2 class="page-header">My post</h2> -->
	<!-- <p>We want to share our content with the world. We want to give the public <strong>read authorization</strong> to anyone that is authenticated.</p>
	<p>It would be very bad if someone could edit our comments though. (Say bad things about Nyan-cat.) We want to deny the public <strong>write authorization</strong>. We only want an authenticated user ... <em>YOU</em> to be able to have <strong>write authorization</strong>.</p> -->
	<!-- <comments-mine></comments-mine> -->

	<h2 class="page-header">Class discussion</h2>

	<post-list></post-list>

	<br><br>

	<script>
		var that = this;

		this.userPhotoURL = "http://placehold.it/50x50";
		this.user = firebase.auth().currentUser;
	</script>

	<style>
		:scope {
			display: block;
		}
		h2 {
			font-family: Copperplate, "Copperplate Gothic Light", fantasy;
			font-size: 2em;
			font-style: normal;
			line-height: 2;
			font-weight: bolder;
			text-align: left;
			color: black;
		}
		h5 {
			margin: 0;
			font-family: "Big Caslon", "Book Antiqua", "Palatino Linotype", Georgia;
			font-size: 1em;
			font-style: normal;
			font-size: 1.2em;
			line-height: 2;
			font-weight: bolder;
			color: black;
		}

	</style>
</members>
