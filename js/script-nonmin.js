//Init
var login = "";
login += '<input type="text" placeholder="Username" name="user" id="userF" size="30" required pattern="^[a-zA-Z][a-zA-Z0-9-_\.]{5,12}$"/><br>';
login += '<input type="password" placeholder="Password" name="pass" id="passF" size="30" required pattern="(?=^.{5,12}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"/> ';
login += '<br><div id="LoginError"></div><br>';
login += "<div id=\"bottomlogin\"><div id=\"regpass\"> <br><br><br></div>";
login += "<a class=\"button\" id=\"loginb\">Login</a>";
login += "<div id=\"preload\"></div></div>";

//multiple datasets
var artist_T = [];
var album_T = [];
var genre_T = [];
var track_T = [];




$(document).ready(function() {
	var id = getCookie('sessionID');
	var key = getCookie('sessionKey');

	if (id != null && key != null) {
		$.ajax({
			type : "POST",
			url : "./php/cookie.php"
		}).done(function(d) {
			console.log(d);
			if (d != 0) {
				$("#login").text("");
				$("#login").append('Logout');
				$("#login").attr('id', 'logout');
				$("#reg").hide();
				$("#titlescreen").fadeOut(400);
				$("#logout").click(function(event) {LogoutClick();});
				ShowMusicList();
				ShowRecommend();
				
				if(d != 1)
				{
					$("#botmenu").html(d);
				}
				
				
				$("#add_album").click(function(event) {AddAlbum();});
				$("#add_artist").click(function(event) {AddArtist();});
				$("#add_genre").click(function(event) {AddGenre();});
				$("#add_track").click(function(event) {AddTrack();});
			}
			else
			{
				$("#login").click(function(event) {LoginClick();});
				$("#reg").click(function(event) {RegClick();});
			}
		});
	}
	else
	{
		$("#login").click(function(event) {LoginClick();});
		$("#reg").click(function(event) {RegClick();});
	}
	
	
	// Dashboard clicks
	$(".item").click(function(event){LogoutClick(event);});

	
});

//Clicks

function LoginClick() {
	TINY.box.show({
		html : login,
		animate : true,
		close : false,
		fixed : false
	});
	$(document).on("click", "#loginb", LoginUser);
};

function LogoutClick() 
{
	$.ajax({
		type : "POST",
		url : "./php/logout.php"
	}).done(function(d) {
		$("#titlescreen").fadeIn(400);
		location.reload();
	});
};

function RegClick() {
	
	var reg = "";
	reg += '<input type="text" placeholder="Email" name="uName" id="uNameF" size="30" /><br>';
	reg += '<input type="password" placeholder="Password" name="passF" id="passF" size="30" /><br>';
	reg += '<input type="password" placeholder="Confirm Password" name="passcF" id="passcF" size="30" /><br>';
	reg += '<br><div id="LoginError"></div><br>';
	reg += "<div id=\"bottomlogin\"><div id=\"regpass\"> <br><br><br></div>";
	reg += "<a class=\"button\" id=\"regb\">Register</a>";
	reg += "<div id=\"preload\"></div></div>";
	
	TINY.box.show({
		html : reg,
		animate : true,
		close : false,
		fixed : false
	});
	$(document).on("click", "#regb", RegUser);
};

function AddTrackClick(event)
{
	var tID =  event.target.id.split("-")[0];
	var track = "";
	track += '<input type="text" placeholder="Track URL" name="trackurl" id="trackurlF" size="30" /><br>';
	track += "<a class=\"button\" id=\"trackb-"+tID+"\">Submit</a>";
	
	console.log(tID);
	TINY.box.show({
		html : track,
		animate : true,
		close : false,
		fixed : false
	});
	
	//$("#trackSub a .button").click(function(event){AddTrack(event)});
	$(document).on("click", "#trackb-"+tID, AddTrackUrl);
};


//Functions

function InitSearch()
{
	//$('#smenu .typeahead').typeahead('destory');
	console.log(artist_T);
	$('#smenu .typeahead').typeahead([
      {
    	  name: 'Artist',
    	  local: artist_T,
    	  header: '<h3 class="tname">Artist</h3>'
      },
      {
        name: 'Album',
        local: album_T,
    	header: '<h3 class="tname">Album</h3>'
      },
      {
        name: 'Genre',
        local: genre_T,
    	header: '<h3 class="tname">Genre</h3>'
      },
      {
        name: 'Track',
        local: track_T,
    	header: '<h3 class="tname">Track</h3>'
      }
      
    ]).on('keyup', function (d) {
    	Search($('.tt-query').val());
    }).on('typeahead:selected', function (e) {
    	console.log(e);
    	Search(e.target.value)
    });
}

function Search(q)
{
	//console.log(q);
	
	if(q == "" || q == " ")
	{
		$('.album').show();
	}
	else
	{
		$(".album:not(:contains('"+q+"'))").fadeOut();
		$(".album:contains('"+q+"')").show();
	}
}


function LoginUser() {
	$("#loginb").hide();
	$("#regpass").hide();
	$("#preload").empty();
	$("#preload").html('<div class="progress progress-success progress-striped active"><div class="bar" style="width: 100%;"></div></div>');
	$("#preload").show();
	$.ajax({
		type : "POST",
		url : "./php/login.php",
		data : {
			username : $("#userF").val(),
			pass : $("#passF").val()
		}
	}).done(function(d) 
	{
		$("#regpass").show();
		if(d == 1)
		{
			parent.TINY.box.hide();
			location.reload();
		}
		else if(d == 2)
		{
			$("#bottomlogin").hide();
			$("#preload").hide();
			$("#LoginError").empty().html('Account not verified! Please check your email for a verification code.').hide();
			$("#LoginError").fadeIn(400);
			$("#LoginError").delay(1000).fadeOut(400, function () {
				$("#loginb").show();
				$("#bottomlogin").show();
		      });
		}
		else
		{
			$("#bottomlogin").hide();
			$("#preload").hide();
			$("#LoginError").empty().html('Invalid username or password.').hide();
			$("#LoginError").fadeIn(400);
			$("#LoginError").delay(1000).fadeOut(400, function () {
				$("#loginb").show();
				$("#bottomlogin").show();
		      });
		}
	});
};

function RegUser()
{
	
	var emailR = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	var user = $("#uNameF").val();
	
	$("#regb").hide();
	$("#regpass").hide();
	$("#preload").empty();
	$("#preload").html('<div class="progress progress-success progress-striped active"><div class="bar" style="width: 100%;"></div></div>');
	$("#preload").show();
	
	
	
	
	console.log(emailR.test(user));
	if(!emailR.test(user))
	{
		$("#bottomlogin").hide();
		$("#preload").hide();
		$("#LoginError").empty().html("Input a vaild email address").hide();
		$("#LoginError").fadeIn(400);
		$("#LoginError").delay(1000).fadeOut(400, function () {
			$("#regb").show();
			$("#bottomlogin").show();
	      });
	}
	else if($("#passF").val() != $("#passcF").val())
	{
		$("#bottomlogin").hide();
		$("#preload").hide();
		$("#LoginError").empty().html("Your passwords do not match!").hide();
		$("#LoginError").fadeIn(400);
		$("#LoginError").delay(1000).fadeOut(400, function () {
			$("#regb").show();
			$("#bottomlogin").show();
	      });
	}
	else if($("#passF").val().length < 4)
	{
		$("#bottomlogin").hide();
		$("#preload").hide();
		$("#LoginError").empty().html("Your password must be larger than 3 characters").hide();
		$("#LoginError").fadeIn(400);
		$("#LoginError").delay(1000).fadeOut(400, function () {
			$("#regb").show();
			$("#bottomlogin").show();
	      });
	}
	else
	{
		$.ajax({
			type : "POST",
			url : "./php/newuser.php",
			data : {
				username : user,
				pass : $("#passF").val()
			}
		}).done(function(d) 
		{

			console.log(d)

			if(d != 1)
			{
				TINY.box.show({
					html : "You are now registered!",
					animate : true,
					close : false,
					fixed : false,
					boxid: 'success',
					autohide:3
				});
			
			}
			else
			{
				$("#bottomlogin").hide();
				$("#preload").hide();
				$("#LoginError").empty().html("Error: Either this user all ready exists or there was another unknown error.").hide();
				$("#LoginError").fadeIn(400);
				$("#LoginError").delay(1000).fadeOut(400, function () {
					$("#regb").show();
					$("#bottomlogin").show();
			      });
			}
		});
	}
	
	

}

function ShowMusicList()
{
	$.ajax({
		type : "POST",
		url : "./php/music.php",
		data : {
			job : "getmusic"
		}
	}).done(function(d) 
	{
		$("#music").text("");
		var data = JSON.parse(d);
		data.forEach(function(album) 
		{
			var artists = "";
			album.Artists.forEach(function(artist)
			{
				artists += artist+",";
				artist_T.push(artist);
			})
			artists = artists.substring(0, artists.length - 1);
			
			
			album.Tracks.forEach(function(track)
			{
				if(album.CoverArt.indexOf("http") !== -1)
				{
					var tHTML = "<div class =\"album\"><p><img src=\""+album.CoverArt+"\" height=\"126\" width=\"126\"></p><p>";
				}
				else
				{
					var tHTML = "<div class =\"album\"><p><img src=\"http:\\\\"+album.CoverArt+"\" height=\"126\" width=\"126\"></p><p>";
				}
				track_T.push(track.TrackName);
				album_T.push(album.AlbumName);
				genre_T.push(album.GenreName);
				tHTML += " Album: "+album.AlbumName+
				"<br> Artist/s: "+artists+
				"<br> Track: "+track.TrackName+
				"<br> Duration: "+track.TrackDuration+"s"+
				"<br> Genre: "+album.GenreName+
				"<br> Release Date: "+album.ReleaseDate+
				"<br> Album Rating: "+album.Rating + "</p>";
				
				tHTML += "<div class =\"albumB\">";
				
				
				if(track.TrackURL != null)
				{
					var url = track.TrackURL+" ";
					if(url.indexOf("http") !== -1)
					{
						tHTML += "<a href=\""+url+"\" target=\"_blank\"><i class=\"icon-play icon-white\"></i></a>";
					}
					else
					{
						tHTML += "<a href=\"http:\\\\"+url+"\" target=\"_blank\"><i class=\"icon-play icon-white\"></i></a>";
					}
				   
				}
				else
				{
					 tHTML += "<a ><i id=\""+track.TrackID+"-"+album.AlbumID+"\"class=\"icon-plus icon-white\"></i></a>";
				}
				
				tHTML += "<div id=\""+track.TrackID+"\"></div> "+"</div>";
			
				
				tHTML += "</div>"+" ";
				
				if(track.TrackRating == 0)
				track.TrackRating = 1;
				
				$("#music").append(tHTML);
				$("#"+track.TrackID).raty({
					precision: true,
					score : track.TrackRating /2,
					  click: function(score, evt) 
					  {
						RateAlbum($(this).attr('id') , score*2);
					  }
					});
			})
			
			
		    //console.log(album);
		});
		artist_T =_.uniq(artist_T, false);
		artist_T = _.compact(artist_T);
		genre_T =_.uniq(genre_T, false);
		genre_T = _.compact(genre_T);
		album_T = _.uniq(album_T, false);
		track_T = _.uniq(track_T, false);
		$("#can #music .albumB a .icon-plus").click(function(event){AddTrackClick(event)});
		InitSearch();
	});	

}

function ShowRecommend()
{
	$.ajax({
		type : "POST",
		url : "./php/music.php",
		data : {
			job : "getrecommend"
		}
	}).done(function(d) 
	{
		var data = JSON.parse(d);
		var html = "<br> Track Recommendations: ";
		
		data.forEach(function(t){
			
			html += " "+t+",";
			
		});
		html=html.slice(0,-1);
		$("#node").html(html);
	});
}


function RateAlbum(id, score)
{
	$.ajax({
		type : "POST",
		url : "./php/music.php",
		data : {
			job : "rate",
			id : id,
			rating : score,
			user: getCookie('sessionID')
		}
	}).done(function(d) 
	{
		console.log(d);
		if(parseInt(d) != -1)
		{
			$("#"+id).raty('score',d/2);
			
			
			TINY.box.show({
				html : "You have all ready rated this album, go rate some others instead.",
				animate : true,
				close : false,
				fixed : false,
				boxid: 'error',
				autohide:4
			});
		}
		else
		{
			TINY.box.show({
				html : "Your rating was submited!",
				animate : true,
				close : false,
				fixed : false,
				boxid: 'success',
				autohide:3,
				closejs:function(){ShowMusicList()}
		
			});
		}
	});
	

}

function AddTrackUrl(event)
{
	var id = event.target.id.split("-")[1];
	var filter=/^(http[s]?:\/\/){0,1}(www\.){0,1}[a-zA-Z0-9\.\-]+\.[a-zA-Z]{2,5}[\.]{0,1}/;
    var trackURL = $("#trackurlF").val();
	if(!filter.test(trackURL))
	{
		TINY.box.show({
			html : "You have entered a invalid URL. Please try again.",
			animate : true,
			close : false,
			fixed : false,
			boxid: 'error',
			autohide:4
		});
	}
	else
	{
		$.ajax({
			type : "POST",
			url : "./php/music.php",
			data : {
				job : "track",
				id : id,
				turl : trackURL
			}
		}).done(function(d) 
		{
			TINY.box.show({
				html : "Your URL was submited!",
				animate : true,
				close : false,
				fixed : false,
				boxid: 'success',
				autohide:3,
				closejs:function(){ShowMusicList()}
		
			});
		});
		
	}
	
}

function AddAlbum()
{
	var albumAdd= "";
	albumAdd += '<input type="text" placeholder="Album Name" name="aname" id="anameF"/><br>';
	albumAdd += '<input type="text" placeholder="CoverArt URL" name="acover" id="acoverF"/> <br>';
	albumAdd += 'Release Date <br>';
	albumAdd += '<input type="date" name="adate" id="adateF" /> <br>';
	
	$.ajax({
		type : "POST",
		url : "./php/music.php",
		data : {
			job : "getgenres"
		}
	}).done(function(d) 
	{
		genres = JSON.parse(d);
		console.log(genres);
		albumAdd += 'Albums Genre <br>';
		albumAdd += '<select id="agenre">';
		genres.forEach(function(genre){	
			albumAdd += "<option>"+genre.GenreName+"</option>";
		})
		albumAdd += "</select> <br>";
		
		$.ajax({
			type : "POST",
			url : "./php/music.php",
			data : {
				job : "getartists"
			}
		}).done(function(d) 
		{
			artists = JSON.parse(d);
			console.log(artists);
			albumAdd += 'Albums Artist <br>';
			albumAdd += '<select id="aartist">';
			artists.forEach(function(artist){	
				albumAdd += "<option>"+artist.ArtistName+"</option>";
			})
			albumAdd += "</select> <br>";
			
			albumAdd += '<div id="LoginError"></div><br>';
			albumAdd += '<div id="bottomlogin"> ';
			albumAdd += '<a  class="button" id="addalbumb"/>Add </a>';
			albumAdd += '<div id="preload"></div></div> <br><br>';
			TINY.box.show({
				html : albumAdd,
				animate : true,
				close : false,
				fixed : false
			});
			$(document).on("click", "#addalbumb", SubmitAddAlbum);
		});	
		
	});	
}

function SubmitAddAlbum()
{
	var urlfilter=/^(http[s]?:\/\/){0,1}(www\.){0,1}[a-zA-Z0-9\.\-]+\.[a-zA-Z]{2,5}[\.]{0,1}/;
	var AlbumName = $("#anameF").val();
	var AlbumDate = $("#adateF").val();
	var AlbumURL = $("#acoverF").val();
	var AlbumGenre = $("#agenre").val();
	var AlbumArtist = $("#aartist").val();
	
	console.log(AlbumName);
	console.log(AlbumDate);
	console.log(AlbumURL);
	console.log(AlbumGenre);
	console.log(AlbumArtist);
	
	if(!urlfilter.test(AlbumURL))
	{
		TINY.box.show({
			html : "You have entered a invalid URL. Please try again.",
			animate : true,
			close : false,
			fixed : false,
			boxid: 'error',
			autohide:4
		});
	}
	else if(AlbumName == "" || AlbumName == null)
	{
		TINY.box.show({
			html : "You must have a album name! Please try again.",
			animate : true,
			close : false,
			fixed : false,
			boxid: 'error',
			autohide:4
		});
	}
	else
	{
		$.ajax({
			type : "POST",
			url : "./php/music.php",
			data : {
				job : "addAlbum",
				aName: AlbumName,
				aDate: AlbumDate,
				aURL: AlbumURL,
				aGenre: AlbumGenre,
				aArtist: AlbumArtist
					
				}
		}).done(function(d) 
		{
			console.log(d);
			TINY.box.show({
				html : "Your Album was submited!",
				animate : true,
				close : false,
				fixed : false,
				boxid: 'success',
				autohide:3,
				closejs:function(){ShowMusicList()}
		
				});
		});	
	}
}
function AddArtist()
{

	var artistHTML = "";
	artistHTML += '<input type="text" placeholder="Artist Name" name="artName" id="artNameF" size="30" /><br>';
	artistHTML += "<a class=\"button\" id=\"addartist\">Add</a>";
	

	TINY.box.show({
		html : artistHTML,
		animate : true,
		close : false,
		fixed : false
	});

	$(document).on("click", "#addartist", AddArtistSubmit);

}

function AddArtistSubmit()
{
	var ArtistName = $("#artNameF").val();
	
	if(!ArtistName)
	{
		TINY.box.show({
			html : "You must have a artist name! Please try again.",
			animate : true,
			close : false,
			fixed : false,
			boxid: 'error',
			autohide:4
		});
	}
	else
	{
		$.ajax({
			type : "POST",
			url : "./php/music.php",
			data : {
				job : "addArtist",
				aName: ArtistName
			}
		}).done(function(d) 
		{
			TINY.box.show({
				html : "Your Artist was submited!",
				animate : true,
				close : false,
				fixed : false,
				boxid: 'success',
				autohide:3,
				closejs:function(){ShowMusicList()}
		
				});
		});		
	}
}

function AddGenre()
{

	var genreHTML = "";
	genreHTML += '<input type="text" placeholder="Genre Name" name="gName" id="gNameF" size="30" /><br>';
	genreHTML += "<a class=\"button\" id=\"addgenre\">Add</a>";
	

	TINY.box.show({
		html : genreHTML,
		animate : true,
		close : false,
		fixed : false
	});

	$(document).on("click", "#addgenre", AddGenreSubmit);

}

function AddGenreSubmit()
{
	var GenreName = $("#gNameF").val();
	
	if(!GenreName)
	{
		TINY.box.show({
			html : "You must have a genre name! Please try again.",
			animate : true,
			close : false,
			fixed : false,
			boxid: 'error',
			autohide:4
		});
	}
	else
	{
		$.ajax({
			type : "POST",
			url : "./php/music.php",
			data : {
				job : "addGenre",
				gName: GenreName
			}
		}).done(function(d) 
		{
			TINY.box.show({
				html : "Your Genre was submited!",
				animate : true,
				close : false,
				fixed : false,
				boxid: 'success',
				autohide:3,
				closejs:function(){ShowMusicList()}
		
				});
		});		
	}
}

function AddTrack()
{
	var trackAdd= "";
	trackAdd += '<input type=text placeholder="Track Name" name="tname" id="tnameF"/><br>';
	trackAdd += '<input type=number placeholder="Track Duration in Seconds" name="tdur" id="tdurF"/> <br>';
	trackAdd += '<input type=text placeholder="Tracks URL" name="turl" id="turlF"/> <br>';
	
	$.ajax({
		type : "POST",
		url : "./php/music.php",
		data : {
			job : "getalbums"
		}
	}).done(function(d) 
	{
		albums = JSON.parse(d);
		trackAdd += 'Tracks Album <br>';
		trackAdd += '<select id="talbum">';
		albums.forEach(function(album){	
			trackAdd += "<option>"+album.AlbumName+"</option>";
		})
		trackAdd += "</select> <br>";
		
		trackAdd += '<div id="LoginError"></div><br>';
		trackAdd += '<div id="bottomlogin"> ';
		trackAdd += '<a  class="button" id="addtrack"/>Add </a>';
		trackAdd += '<div id="preload"></div></div> <br><br>';
		TINY.box.show({
			html : trackAdd,
			animate : true,
			close : false,
			fixed : false
		});
		
		$(document).on("click", "#addtrack", SubmitAddTrack);
	});		

}




function SubmitAddTrack()
{
	var urlfilter=/^(http[s]?:\/\/){0,1}(www\.){0,1}[a-zA-Z0-9\.\-]+\.[a-zA-Z]{2,5}[\.]{0,1}/;
	var TrackName = $("#tnameF").val();
	var TrackDur = $("#tdurF").val();
	var TrackURL = $("#turlF").val();
	var TrackAlbum= $("#talbum").val();
	
	console.log(TrackName);
	console.log(TrackDur);
	console.log(TrackURL);
	console.log(TrackAlbum);
	

	if(TrackURL && !urlfilter.test(TrackURL))
	{
		TINY.box.show({
			html : "You have entered a invalid URL. Please try again.",
			animate : true,
			close : false,
			fixed : false,
			boxid: 'error',
			autohide:4
		});
	}
	else if(!TrackName)
	{
		TINY.box.show({
			html : "You must have a track name! Please try again.",
			animate : true,
			close : false,
			fixed : false,
			boxid: 'error',
			autohide:4
		});
	}
	else if(!TrackDur && TrackDur < 0)
	{
		TINY.box.show({
			html : "You must have a track duration in seconds! Please try again.",
			animate : true,
			close : false,
			fixed : false,
			boxid: 'error',
			autohide:4
		});
	}
	else
	{
		if(!TrackURL){TrackURL == null; console.log(true)}
		
		$.ajax({
			type : "POST",
			url : "./php/music.php",
			data : {
				job : "addTrack",
				tName: TrackName,
				tDur: TrackDur,
				tURL: TrackURL,
				tAlbum: TrackAlbum
				}
		}).done(function(d) 
		{
			console.log(d);
			TINY.box.show({
				html : "Your Track was submited!",
				animate : true,
				close : false,
				fixed : false,
				boxid: 'success',
				autohide:3,
				closejs:function(){ShowMusicList()}
		
				});
		});	
	}
	
}

function getCookie(key) {
	var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
	return keyValue ? keyValue[2] : null;
}

// Events

$(window).resize(function() 
{
	//var containerWidth = $("#main").width();
	//$("#dash").width(containerWidth - 450);
});

