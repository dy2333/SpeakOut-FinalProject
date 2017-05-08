<post-list>

	<post-item each={ posts }></post-item>



	<script>


		var that = this;

		this.creatingReply = false;

			this.ReplyEditor = function (event) {
					that.creatingReply = true;
			};
			this.closeEditor = function (event) {
            that.creatingReply = false;

        };
		this.posts = [];

		var database = firebase.database();
		var postsRef = database.ref('posts');

		postsRef.on('value', function (snapshot) {
			var commentsData = snapshot.val();

			if (commentsData) {

				that.posts = Object.values(commentsData);
			} else {
				that.posts = [];
			}
			console.log("posts");
			console.log(that.posts);
			that.update();
		});

		this.on('unmount', function (event) {
			postsRef.off('value');
		});

		// this.myReplys = [];
		// var database = firebase.database();
		// var myReplyRef = database.ref('reply');
		//
		// // this.fakeList = [{msg:"A"},{msg:"B"},{msg:"C"}];
		//
		// myReplyRef.on('value', function (snapshot) {
		// 	var data = snapshot.val();
		//
		// 	console.log(data);
		//
		// 	var replys = [];
		// 	for (var key in data) {
		// 		replys.push(data[key]);
		// 	}
		// 	console.log(replys);
		// 	that.myReplys = replys;
		//
		// 	console.log(that.myReplys);
		//
		// 	//
		// 	// console.log('this.parent -------', that.parent);
		// 	that.update();
		// 	// console.log(that);
		//
		// });
	</script>

	<style>
		:scope {
			display: block;
			background: rgba(255, 255, 255, 0.4);
			border: 1px solid #333;
			border-radius: 5px;
			padding:20px;
			margin: 15px;
		}
		form {
			padding: 15px;
		}

	</style>
</post-list>
