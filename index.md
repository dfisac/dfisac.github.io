
---
title: "Home"
permalink: "/"
layout: page
---

    I am a postdoc at ETH Zürich with
    <a href="https://yilwang.weebly.com/">Yilin Wang</a>.

    <br><br>

    Before, I was a postdoc at Université Paris-Est Créteil,
    mentored by
    <a href="https://fanoni.perso.math.cnrs.fr/">Federica Fanoni</a>,
    and shortly a postdoc in this
    <a href="https://portalrecerca.uab.cat/en/projects/estructuras-y-desigualdades-geometricas-universales-2/">group</a>
    at Universitat Autònoma de Barcelona.

    <br><br>

    In 2025, I obtained my PhD under the co-supervision of
    <a href="https://mat.uab.cat/~fbalacheff/">Florent Balacheff</a>
    at Universitat Autònoma de Barcelona and
    <a href="https://homeweb.unifr.ch/parlierh/pub/">Hugo Parlier</a>
    at the University of Luxembourg.

    Before, I completed my MSc in Pure Mathematics at
    Imperial College London under the supervision of
    Marie-Amélie Lawn.

    <br><br>

    Here is my <a href="/CV.pdf">CV</a>.



  <div class="home-photo">
    <img src="/jopeto.jpg" alt="David Fisac">
  </div>



Some of the things that help my existence are in the following pictures.

<div id="image-slider" style="max-width: 1200px; position: relative; overflow: hidden; margin: 24px auto; border-radius: 16px; box-shadow: 0 10px 30px -12px rgba(0,0,0,.35);">

  <div id="slider-container" style="display: flex; transition: transform 0.5s ease;">
    <img src="/guix1.jpg" alt="Image 1" style="width: 100%; flex-shrink: 0;">
    <img src="/guix2.jpg" alt="Image 2" style="width: 100%; flex-shrink: 0;">
    <img src="/guix3.jpg" alt="Image 3" style="width: 100%; flex-shrink: 0;">
    <img src="/guix4.jpg" alt="Image 4" style="width: 100%; flex-shrink: 0;">
    <img src="/guix5.jpg" alt="Image 5" style="width: 100%; flex-shrink: 0;">
  </div>

  <button id="prev-btn" style="position:absolute; top:50%; left:14px; transform:translateY(-50%); width:42px; height:42px; border-radius:999px; background:rgba(255,255,255,.82); backdrop-filter:blur(6px); border:none; cursor:pointer; font-size:18px; color:#0c8ea3; box-shadow:0 2px 10px rgba(0,0,0,.18);">❮</button>

  <button id="next-btn" style="position:absolute; top:50%; right:14px; transform:translateY(-50%); width:42px; height:42px; border-radius:999px; background:rgba(255,255,255,.82); backdrop-filter:blur(6px); border:none; cursor:pointer; font-size:18px; color:#0c8ea3; box-shadow:0 2px 10px rgba(0,0,0,.18);">❯</button>

</div>

<div id="image-footnote" style="text-align: center; margin-top: 10px; font-style: italic;">
</div>

<script>
  const sliderContainer = document.getElementById('slider-container');
  const footnote = document.getElementById('image-footnote');
  const images = sliderContainer.children;
  const totalImages = images.length;

  const footnotes = [
    "This is a boulder problem I love called 'There is no spoon' in Ticino, Switzerland.",
    "Souvenir of nice times of collaboration with Mingkun Liu.",
    "Some vegetables we planted in my hometown's community garden on a sunny winter.",
    "A beautiful calçotada.",
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

  updateSlider();
</script>

# E-mail

d.fisac2@gmail.com
