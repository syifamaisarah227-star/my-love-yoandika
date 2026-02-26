<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Buat Yoandika Bagus Pangestu 💖</title>

<style>
*{margin:0;padding:0;box-sizing:border-box;}

body{
    font-family:'Georgia',serif;
    background:black;
    color:white;
    overflow:hidden;
}

/* Background */
.bg{
    position:fixed;
    width:100%;
    height:100%;
    background:url('background.jpg') center/cover no-repeat;
    filter:blur(8px) brightness(40%);
    z-index:-2;
}

/* Login */
#login{
    position:fixed;
    width:100%;
    height:100%;
    display:flex;
    justify-content:center;
    align-items:center;
    flex-direction:column;
    background:black;
    z-index:10;
}

input{
    padding:10px 15px;
    border-radius:20px;
    border:none;
    text-align:center;
    margin-bottom:15px;
}

button{
    padding:8px 20px;
    border:none;
    border-radius:20px;
    background:#ff4d6d;
    color:white;
    cursor:pointer;
}

/* Black Screen */
#blackScreen{
    position:fixed;
    width:100%;
    height:100%;
    background:black;
    display:none;
    z-index:9;
}

/* Cinematic */
#opening{
    position:fixed;
    width:100%;
    height:100%;
    background:black;
    display:none;
    justify-content:center;
    align-items:center;
    flex-direction:column;
    z-index:8;
}

#opening h1{
    font-size:42px;
    animation:fadeZoom 3s forwards;
}

@keyframes fadeZoom{
    from{opacity:0; transform:scale(0.8);}
    to{opacity:1; transform:scale(1.1);}
}

/* Content */
#content{
    display:none;
    padding:60px 20px;
    text-align:center;
    overflow-y:auto;
    height:100vh;
}

#typed{
    max-width:800px;
    margin:auto;
    line-height:1.9;
    white-space:pre-line;
    font-size:18px;
}

/* Gallery */
.gallery{
    margin-top:40px;
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(200px,1fr));
    gap:15px;
}

.gallery img{
    width:100%;
    border-radius:20px;
}

/* Salju */
.snow{
    position:fixed;
    top:-20px;
    animation:fall linear forwards;
}

@keyframes fall{
    to{transform:translateY(110vh);}
}
</style>
</head>
<body>

<div class="bg"></div>

<!-- LOGIN -->
<div id="login">
    <h2>Masukkan Kata Sandi 💌</h2>
    <input type="password" id="password" placeholder="Kata sandi...">
    <button onclick="checkPassword()">Masuk</button>
    <p id="error" style="color:pink;margin-top:10px;"></p>
</div>

<div id="blackScreen"></div>

<!-- CINEMATIC -->
<div id="opening">
    <h1>Yoandika ❤️ Maica</h1>
</div>

<!-- CONTENT -->
<div id="content">
    <h2>Untuk kamu, sayangku 💖</h2>
    <p id="typed"></p>

    <div class="gallery">
        <img src="foto1.jpg">
        <img src="foto2.jpg">
        <img src="foto3.jpg">
        <img src="foto4.jpg">
        <img src="foto5.jpg">
        <img src="foto6.jpg">
        <img src="foto7.jpg">
    </div>
</div>

<!-- Audio -->
<audio id="heartbeat">
    <source src="heartbeat.mp3" type="audio/mpeg">
</audio>

<audio id="music" loop>
    <source src="sekarang-hingga-nanti-kita-tua.mp3" type="audio/mpeg">
</audio>

<script>
const correctPassword = "ILoveMaica";

function checkPassword(){
    const input = document.getElementById("password").value;
    if(input === correctPassword){

        document.getElementById("login").style.display="none";
        document.getElementById("blackScreen").style.display="block";

        const heartbeat = document.getElementById("heartbeat");
        heartbeat.play();

        setTimeout(()=>{
            document.getElementById("blackScreen").style.display="none";
            document.getElementById("opening").style.display="flex";
        },3000);

        setTimeout(()=>{
            document.getElementById("opening").style.display="none";
            document.getElementById("content").style.display="block";
            document.getElementById("music").play();
            typeEffect();
        },6000);

    } else {
        document.getElementById("error").innerText="Kata sandi salah, coba lagi sayang 💔";
    }
}

const text = `Sayangku Yoandika...

Terima kasih sudah hadir di hidupku.
Terima kasih sudah memilih untuk tetap tinggal,
bahkan ketika keadaan tidak selalu mudah.

Kamu adalah alasan kenapa aku percaya
bahwa cinta itu benar-benar ada.

Maaf kalau aku pernah membuat kamu kecewa.
Maaf kalau sikapku pernah melukai hatimu.
Aku masih belajar menjadi yang terbaik untukmu,
dan aku tidak akan berhenti belajar.

Ada satu hal yang ingin aku jujur akui…

Sejak kamu hadir,
hidupku terasa jauh lebih berarti.
Hari-hariku punya tujuan.
Senyumku punya alasan.

Aku sudah terlalu nyaman dengan caramu menenangkan aku,
terlalu terbiasa dengan perhatian kecilmu,
dan terlalu bersyukur memiliki kamu di sisiku.

Mungkin aku tidak selalu pandai menunjukkan perasaan,
tapi percayalah…
aku menghargai setiap detik yang kita jalani bersama.

Aku ingin terus berjalan denganmu.
Bukan karena takut sendirian,
tapi karena bersamamu terasa seperti rumah.

Kalau suatu hari nanti keadaan menguji kita,
aku ingin kamu tahu,
aku akan tetap berusaha bertahan dan memperjuangkan kita.

Karena bagiku,
kamu bukan sekadar seseorang yang singgah.
Kamu adalah bagian penting dari cerita hidupku.

Dan selama kamu masih mau bersamaku,
aku akan terus memilih kamu,
lagi dan lagi. 💖`;

Aku sayang kamu, sayangku. 💖`;

let i=0;
function typeEffect(){
    if(i<text.length){
        document.getElementById("typed").innerHTML+=text.charAt(i);
        i++;
        setTimeout(typeEffect,40);
    }
}

/* Salju Slow Motion */
function createSnow(){
    let snow=document.createElement("div");
    snow.classList.add("snow");
    snow.innerHTML="💗";
    snow.style.left=Math.random()*100+"vw";
    snow.style.fontSize=(Math.random()*20+15)+"px";
    snow.style.animationDuration=(Math.random()*6+6)+"s";
    document.body.appendChild(snow);
    setTimeout(()=>snow.remove(),12000);
}
setInterval(createSnow,500);
</script>

</body>
</html>
