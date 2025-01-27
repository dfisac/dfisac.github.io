---
title: "Home"
permalink: "/"
layout: page
---

I am a postdoc at Universitat Autònoma de Barcelona with the following <a href="https://portalrecerca.uab.cat/en/projects/estructuras-y-desigualdades-geometricas-universales-2"> group</a>.

I recently completed my PhD under the co-supervision of <a href="https://mat.uab.cat/~fbalacheff/"> Florent Balacheff</a> at Universitat Autònoma de Barcelona and <a href="https://math.uni.lu/parlier/"> Hugo Parlier</a> at the University of Luxembourg.

Before, I completed my Pure Mathematics MSc at Imperial College London under the supervision of Marie-Amélie Lawn.

Here is my <a href="/CV.pdf" class="image fit">CV</a>.

Some of the things that help my existence are in the following pictures.

<div id="image-slider" style="max-width: 1200px; position: relative; overflow: hidden; margin: 20px auto;">
  <div id="slider-container" style="display: flex; transition: transform 0.5s ease;">
    <img src="https://github.com/dfisac/dfisac.github.io/blob/master/guix1.jpg?raw=true" alt="Image 1" style="width: 100%; flex-shrink: 0;">
    <img src="https://github.com/dfisac/dfisac.github.io/blob/master/guix2.jpg?raw=true" alt="Image 2" style="width: 100%; flex-shrink: 0;">
    <img src="https://github.com/dfisac/dfisac.github.io/blob/master/guix3.jpg?raw=true" alt="Image 3" style="width: 100%; flex-shrink: 0;">
  </div>
  <button id="prev-btn" style="position: absolute; top: 50%; left: 10px; transform: translateY(-50%); background: #fff; border: none; cursor: pointer; padding: 5px; font-size: 18px;">❮</button>
  <button id="next-btn" style="position: absolute; top: 50%; right: 10px; transform: translateY(-50%); background: #fff; border: none; cursor: pointer; padding: 5px; font-size: 18px;">❯</button>
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
    "Some nice vegetables we planted in my hometown's community garden on a sunny winter."
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
Despatx C1/-162 <br />
Departament de Matemàtiques <br />
Facultat de Ciències <br />
Universitat Autònoma de Barcelona <br />
08193 Bellaterra (Barcelona), Spain

# E-mail
david dot fisac at uab dot cat
