<app>
	<div id="heading">
		<div class="content-blocks">
			<br><br><br><br><br>
			<div class="content-block">
				<h2>Speak-out --</h2><br>
				<p>
					It is easy to participate in the class
				</p>
			</div>
			<div class="content-block content-block--small">
				<h2>
					Discussion question:
				</h2>
				<p>How do you think social media can support eLearning?</p>
			</div>
		</div>
		<div class="button">
			<button if={ !user } class="btn btn-success pull-right" onclick={ logIn }>
				Login
			</button>
			<button if={ user } class="btn btn-danger pull-right" onclick={ logOut }>
				logout
			</button>
		</div>
		<br>
	</div>
	<div id="post">
		<home if={ !user }></home>
		<members if={ user }></members>
	</div>

	<script>
		var that = this;

		// firebase.auth().currentUser will always reflect the current authenticated user state. Gives a user object if logged in. Gives null if logged out.
		this.user = firebase.auth().currentUser;

		/* --------------------------------------------------
			AUTHENTICATION -> firebase.auth()
			1) onAuthStateChanged()
			2) signInWithPopup()
			3) signOut()

			ATOMIC WRITES
			1) ref.update(updateObject)
			2) See data architecture implications

			AUTHORIZATION
			1) Rules and cascades
			2) Keywords
				- auth
				- $something
				- data
				- newData
		-------------------------------------------------- */

		// AUTHENTICATION LISTENER Once we code this, we have a "live" listener that is constantly listening for whether the user is logged in or not. It will fire the callback if it "hears" a login, or logout.
		firebase.auth().onAuthStateChanged(function (userObj) {
			that.user = firebase.auth().currentUser;
			that.update();
		});

		logIn(event) {
			// Specify that you want to sign up with Google authentication
			var provider = new firebase.auth.GoogleAuthProvider();

			// Popover signup is probably the most simple and trusted.
			firebase.auth().signInWithPopup(provider);
		}

		logOut(event) {
			firebase.auth().signOut();
		}
	</script>

	<style>
		:scope {
			display: block;
		}

	</style>
</app>
