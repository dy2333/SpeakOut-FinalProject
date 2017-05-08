<post-item>

	<div>
		<p>
			<strong>{author}</strong>
			:
			<span>{message}</span>

			<button type="button" class="btn btn-primary" name="button" onclick={ replyEditor }>Comment</button>

			<button type="button" class="btn btn-primary" onclick={ closeEditor }>Cancel</button>

		</p>
		<div class="comments" each={ myComments }>
			<h1>
				<small>{ author }: { msg }</small>

			</h1>
		</div>
		<comment-editor if={ creatingComment } postid={ id }></comment-editor>

		<div class="like">

			<button class="btn btn-danger" type="button" onclick={ addLike }>
				<span class="heart"></span>
			</button>&nbsp&nbsp{ likes }
		</div>
	</div>

	<script>
		var that = this;
		console.log("post-item this.id");
		console.log(this.id);
		this.postID = this.id;
		this.myComments = [];
		var database = firebase.database();
		var commentsRef = database.ref('posts/' + this.postID + '/comments');
		console.log('posts/' + this.postID + '/comments');

		console.log('comment-editor', this);

		this.likeCount = 1;

		// this.fakeList = [{msg:"A"},{msg:"B"},{msg:"C"}];

		commentsRef.on('value', function (snapshot) {
			var data = snapshot.val();
			console.log("data");
			console.log(data);

			var comments = [];
			for (var key in data) {
				comments.push(data[key]);
			}
			console.log(comments);
			that.myComments = comments;
			console.log("myComments");
			console.log(that.myComments);

			//
			// console.log('this.parent -------', that.parent);
			that.update();
			// console.log(that);

		});

		// this.likeButton = false;
		//
		// this.likeCount = function (event) { 	that.likeButton = !that.likeButton; };

		var that = this;

		this.addLike = function (event) {
			var database = firebase.database();
			var likesRef = database.ref('posts/' + this.postID + '/likes');
			var likedUsersRef = database.ref('posts/' + this.postID + '/likedUsers');

			likesRef.once('value', function (snapshot) {
				console.log("likesRef snapshot");
				console.log(snapshot.val());

				var currentLikes = snapshot.val()
					? snapshot.val()
					: 0;
				// currentLikes++; var key = likedUsersRef.push().key;
				var key = firebase.auth().currentUser.uid;

				var newLikeUser = {};
				newLikeUser.id = key;
				newLikeUser.author = firebase.auth().currentUser.displayName;

				database.ref('posts/' + this.postID + '/likedUsers/' + key);
				// likedUsersRef.child(key).set(newLikeUser);

				console.log("currentLikes");
				console.log(currentLikes);

				likedUsersRef.once('value', function (snapshot) {
					var checkUser = snapshot.val();
					console.log("checkUser");
					console.log(checkUser);
					var x = firebase.auth().currentUser.uid;

					if (checkUser && checkUser[x]) {
						console.log("user already liked");
						// stay the same
					} else {
						console.log("new user like");
						// increment
						currentLikes++;

					}

					likedUsersRef.child(key).set(newLikeUser);

				});

				likesRef.set(currentLikes);

			});
		}

		this.creatingComment = false;
		console.log('reply-editor');

		this.replyEditor = function (event) {
			console.log('replyEditor', this);
			// console.log("ReplyEditor"); console.log(this); console.log(that);
			this.creatingComment = true;
			// this.update(); this.closeEditor();
		};
		this.closeEditor = function (event) {
			this.creatingComment = false;
			// that.update();
		};

		// this.myReply = []; postReply(event) {   var newTask = {};   if (event.type === "click") {     newTask.task = this.refs.comment.value;     console.log('xxx', this.refs.comment);     this.myReply.push(newTask);   } }   var database =
		// firebase.database();   var myReplyRef = database.ref('myreply'); myReplyRef.on('child_added', function(snapshot) {
		//
		//     var data = snapshot.val(); // Object with properties as keys         data.id = snapshot.key;
		//
		//     that.myReply.push(data);     that.update();   });
	</script>
	<style>
		:scope {
			display: block;
			font-family: "Book Antiqua", Georgia, serif;
			background: rgba(255, 255, 255, 0.4);
			border: 1px solid #333;
			border-radius: 5px;
			padding: 20px;
			margin: 15px;
		}
		.comments {
			display: block;
			background: rgba(255, 255, 255, 0.6);
			border-radius: 5px;
			padding: 20px;
			margin: 15px;
		}
		.comments h1 {
			margin: 10px;
			font-family: "Big Caslon", "Book Antiqua", "Palatino Linotype", Georgia, serif;		    font-size: 1em;
			font-size: 1.2em;
			font-style: normal;
			line-height: 2;
			font-weight: bolder;
			text-align: left;
			color: dimgray;
		}
		.like{
			text-align:right;
		}
		.heart:before {
			margin: 2px;
			content: '\2764';
			color: white;
		}

	</style>
</post-item>
