<post-editor>

	<label>Share you thoughts</label>
	<input type="text" class="form-control" ref="post" placeholder="Enter Post" onfocus={ startTimer }><br>

	<span show={ time < 5 }>YOU BETTER HURRY</span>
	<button class="btn btn-primary" onclick={ savepost }>Post
		{ time }</button>

	<script>
		var that = this;
		this.time = 10;

			var timer;
			this.startTimer = function(event){
				if (!timer) {
					timer = setInterval(function(){
						that.time--;
						console.log(that.time);

						if (that.time == 0 ) {
							clearInterval(timer);
							that.savepost();

						}

						that.update();
					}, 1000);
				}
			};


		this.user = firebase.auth().currentUser;

		var database = firebase.database();
		// This reference is important - see database for architecture
		var postsRef = database.ref('posts');


		this.savepost = function(event) {

				var key = postsRef.push().key;
				var post = {
					id: key, // Save copy of postID into my object - easier
					userID: this.user.uid, // global Google authenticated user object
					author: this.user.displayName,
					message: this.refs.post.value,
					public: false,
					createdAt: firebase.database.ServerValue.TIMESTAMP,
					modifiedAt: firebase.database.ServerValue.TIMESTAMP
					// sender:this.user.displayName,
					// replyMessage: this.refs.myReply.value,
				};
				postsRef.child(key).set(post).then(function(result){
				  console.log(result);
				}).catch(function(error){
				  console.log(error.message);
				});

			  clearInterval(timer);

				this.reset();

		}

		reset() {
			this.refs.post.value = "";
			this.time = 10;
			// this.refs.post.focus();
		}
	</script>

	<style>
		:scope {
			display: block;
			font-family: "Big Caslon", "Book Antiqua", "Palatino Linotype", Georgia, serif;
			font-size: 1em;
			border: 2px solid #DDD;
			border-radius: 5px;
			padding: 15px;
			background: rgba(255, 255, 255, 0.5);
		}
	</style>
</post-editor>
