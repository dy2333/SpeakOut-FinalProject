<comment-editor>

	<label>Comment Editor</label>

	<input type="text" class="form-control" ref="comment" placeholder="Enter comment">
	<br>

	<button class="btn btn-primary" onclick={ makeComment }>Comment</button>
	<!-- <div class="comment" each={ myReply }> -->

	<!-- THIS IS WHERE THE COMMENTS GO -->


	<script>
		var that = this;
		this.postID = this.opts.postid;
		this.myComments = [];
		var database = firebase.database();
		var commentsRef = database.ref('posts/' + this.postID + '/comments');

		console.log('comment-editor', this);

		// this.fakeList = [{msg:"A"},{msg:"B"},{msg:"C"}];

		commentsRef.on('value', function (snapshot) {
			var data = snapshot.val();

			console.log(data);

			var comments = [];
			for (var key in data) {
				comments.push(data[key]);
			}
			console.log(comments);
			that.myComments = comments;

			console.log(that.myComments);

			//
			// console.log('this.parent -------', that.parent);
			that.update();
			// console.log(that);

		});

		makeComment(event) {
			var newComment = {};
			if (event.type === "click") {
				newComment.msg = this.refs.comment.value;
				// this.myReply.push(newTask); if (!this.parent.publicComments) { 	this.parent.publicComments = []; } this.parent.publicComments.push(newTask); console.log(this.parent);

				var key = commentsRef.push().key;

				newComment.id = key;
				newComment.author = firebase.auth().currentUser.displayName;

				// console.log(key); myReplyRef.child(newKey).set(newTask);

				database.ref('posts/' + this.postID + '/comments/' + key).set(newComment);

				// database.ref('comments/public/replys/' + postID + '/' + key).set(newTask);

				console.log('---', this, this.refs, this.refs.comment);
				// this.refs.comment.value = "";
			}
		}

		// var reply = { 	id: key, 	userID: this.user.uid, 	author: this.user.displayName, 	message: this.refs.reply.value, 	public: true, 	createdAt: firebase.database.ServerValue.TIMESTAMP, 	modifiedAt: firebase.database.ServerValue.TIMESTAMP 		};
		//
		// 		myReplyRef.child(key).set(comment).then(function(result){ 			console.log(result); }).catch(function(error){ 			console.log(error.message); 		}); 		this.parent.update();

		//
		// } this.user = firebase.auth().currentUser;
		//
		// var database = firebase.database(); // database for architecture var myReplyRef = database.ref('reply/users/' + this.user.uid); this.myReply = []; postReply(event) { 	var newTask = {}; 	if (event.type === "click") { 		newTask.task =
		// this.refs.comment.value; 		console.log('xxx', this.refs.comment); 		this.myReply.push(newTask); 	} } this.postReply = function(event) { 	console.log("postReply"); 	if (event.type === "click") { 		newTask.task = event.target.value;
		// 					this.myReply.push(newTask); 				}

		//

		this.on('unmount', function () {
			console.log('unmount', this);
		});

		reset() {
			this.refs.reply.value = "";
			// this.refs.comment.focus();
		}
	</script>

	<style>
		:scope {
			display: block;
			border: 1px solid #DDD;
			border-radius: 4px;
			padding: 15px;
			margin:15px;

			background-color: white;
		}

	</style>
</comment-editor>
