<home>
	<div >
		<h4>Please login to start to post your message</h4>

	</div>
	<br>
	<br>

	<div >
		<h2 class="page-header">Class discussion</h2>

		<div class="post" each={ posts }>

			<!-- only show the the author and content of the post, no comment button, no like button -->
			<strong>{author}</strong>

			<span>{message}</span>
		</div>

	</div>
	<script>
		var that = this;

		var database = firebase.database();
		var postsRef = database.ref('posts');

		postsRef.on('value', function (snapshot) {
			var commentsData = snapshot.val();

			that.posts = Object.values(commentsData);

			console.log(that.posts);

			that.update();

			// if (commentsData) {
			//
			// 	that.posts = Object.values(commentsData); } else { 	that.posts = []; }
			//
		});
	</script>

	<style>
		:scope {
			display: block;
			background: rgba(255, 255, 255, 0.6);
			padding: 20px;
			margin: 25px;
		}
		h4{
			font-family: Copperplate, "Copperplate Gothic Light", fantasy;
			padding-top: 20px;
			font-size:1.2em;
			text-align: center;
			color:#FF2D2D;

		}
		h2 {
			font-family: Copperplate, "Copperplate Gothic Light", fantasy;
			font-size:2em;
			color: black;
		}
		.post{
			display: block;
			border: 1px solid dimgrey;
			background: rgba(255, 255, 255, 0.8);
			border-radius: 3px;
			padding: 10px;
			margin: 10px;
			font-family: "Big Caslon", "Book Antiqua", "Palatino Linotype", Georgia, serif;		    font-size: 1em;
			font-size: 0.8em;
			font-style: normal;
			line-height: 1.5;
			font-weight: bolder;
			text-align: left;
			color: dimgray;
		}

	</style>
</home>
