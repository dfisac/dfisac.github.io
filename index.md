---
title: "About me"
permalink: "/"
layout: page
---

I am a postdoc at Laboratoire d'Analyse et de Mathématiques Appliquées (<a href="https://lama-umr8050.fr/">LAMA</a>) mentored by <a href="https://fanoni.perso.math.cnrs.fr/">Federica Fanoni</a>.
In 2025, I obtained my PhD under the co-supervision of <a href="https://mat.uab.cat/~fbalacheff/"> Florent Balacheff</a> at Universitat Autònoma de Barcelona and <a href="https://perso.math.u-pem.fr/long.yusen/index.html">Yusen Long</a> at Université Paris-Est Créteil.
Before, I completed my Pure Mathematics MSc at Imperial College London under the supervision of Marie-Amélie Lawn.
Here is my <a href="/CV.pdf" class="image fit">CV</a>.
Some of the things that help my existence are in the following pictures.

<div id="image-slider" style="max-width: 1200px; position: relative; overflow: hidden; margin: 24px auto; border-radius: 16px; box-shadow: 0 10px 30px -12px rgba(0,0,0,.35);">
  <div id="slider-container" style="display: flex; transition: transform 0.5s ease;">
    <img src="https://github.com/dfisac/dfisac.github.io/blob/master/guix1.jpg?raw=true" alt="Image 1" style="width: 100%; flex-shrink: 0;">
    <img src="https://github.com/dfisac/dfisac.github.io/blob/master/guix2.jpg?raw=true" alt="Image 2" style="width: 100%; flex-shrink: 0;">
    <img src="https://github.com/dfisac/dfisac.github.io/blob/master/guix3.jpg?raw=true" alt="Image 3" style="width: 100%; flex-shrink: 0;">
    <img src="https://github.com/dfisac/dfisac.github.io/blob/master/guix4.jpg?raw=true" alt="Image 4" style="width: 100%; flex-shrink: 0;">
    <img src="https://github.com/dfisac/dfisac.github.io/blob/master/guix5.jpg?raw=true" alt="Image 5" style="width: 100%; flex-shrink: 0;">
  </div>
  <button id="prev-btn" style="position:absolute; top:50%; left:14px; transform:translateY(-50%); width:42px; height:42px; border-radius:999px; background:rgba(255,255,255,.82); backdrop-filter:blur(6px); border:none; cursor:pointer; font-size:18px; color:#0c8ea3; box-shadow:0 2px 10px rgba(0,0,0,.18);">❮</button>
  <button id="next-btn" style="position:absolute; top:50%; right:14px; transform:translateY(-50%); width:42px; height:42px; border-radius:999px; background:rgba(255,255,255,.82); backdrop-filter:blur(6px); border:none; cursor:pointer; font-size:18px; color:#0c8ea3; box-shadow:0 2px 10px rgba(0,0,0,.18);">❯</button>
</div>

<div id="image-footnote" style="text-align: center; margin-top: 10px; font-style: italic;">
  Footnote for Image 1
</div>

<script>
  const sliderContainer = document.getElementById('slider-container');
  const footnote = document.getElementById('image-footnote');
  const images = sliderContainer.children;
  const totalImages = images.length;
  const footnotes = [
    "This is a boulder problem I love called 'There is no spoon' in Ticino, Switzerland.",
    "Souvenir of nice times of collaboration with Mingkun Liu.",
    "Some nice vegetables we planted in my hometown's community garden on a sunny winter.",
    "Cooking with friends.",
    "This place."
  ];
  let currentIndex = 0;

  function updateSlider() {
    sliderContainer.style.transform = `translateX(-${currentIndex * 100}%)`;
    footnote.textContent = footnotes[currentIndex];
  }

  document.getElementById('prev-btn').addEventListener('click', () => {
    currentIndex = (currentIndex - 1 + totalImages) % totalImages;
    updateSlider();
  });

  document.getElementById('next-btn').addEventListener('click', () => {
    currentIndex = (currentIndex + 1) % totalImages;
    updateSlider();
  });

  // Initialize the slider and footnote on page load
  updateSlider();
</script>


# Address
Laboratoire d'Analyse et de Mathématiques Appliquées, Université Paris-Est Créteil  
Office P2 230  
61, avenue Général de Gaulle  
94010 Créteil, France  

# E-mail
david.fisac-camara(at)cnrs.fr
