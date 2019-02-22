import "bootstrap";

import "bootstrap-datepicker";
import "bootstrap-datepicker/dist/css/bootstrap-datepicker.css";

// $('.datepicker').datepicker();

let inputData = $('.input-daterange input').each(function() {
    $(this).datepicker({format: 'dd/mm/yyyy'});
});

// ed's javascrip

var container_list = document.querySelectorAll('.break-anim');

container_list.forEach((container) => {
  container.addEventListener('mouseover', imageBreak);
});

const TWO_PI = Math.PI * 2;

function imageBreak(event) {

  var image,
      imageWidth = event.target.offsetWidth,
      imageHeight = event.target.offsetHeight;

  var vertices = [],
      indices = [],
      fragments = [];

  var container = event.target;

  var clickPosition = [imageWidth, imageHeight];

  ///////

  TweenMax.set(container, {perspective:500});

  var url = event.target.style.backgroundImage.replace(/url\(\"/,'').slice(0,-2);
  image = new Image();
  image.src = url;
  image.width = imageWidth;
  image.height = imageHeight;

  container.appendChild(image);

  //TweenMax.fromTo(image, 0.75, {y:-1000}, {y:0, ease:Back.easeOut});

  var box = image.getBoundingClientRect(),
        top = box.top,
        left = box.left;

    clickPosition[0] = event.clientX - left;
    clickPosition[1] = event.clientY - top;

    /// triangulate

  var rings = [
          {r:50, c:12},
          {r:150, c:12},
          {r:300, c:12},
          {r:1200, c:12} // very large in case of corner clicks
      ],
      x,
      y,
      centerX = clickPosition[0],
      centerY = clickPosition[1];

  vertices.push([centerX, centerY]);

  rings.forEach(function(ring) {
      var radius = ring.r,
          count = ring.c,
          variance = radius * 0.25;

      for (var i = 0; i < count; i++) {
          x = Math.cos((i / count) * TWO_PI) * radius + centerX + randomRange(-variance, variance);
          y = Math.sin((i / count) * TWO_PI) * radius + centerY + randomRange(-variance, variance);
          vertices.push([x, y]);
      }
  });

  vertices.forEach(function(v) {
      v[0] = clamp(v[0], 0, imageWidth);
      v[1] = clamp(v[1], 0, imageHeight);
  });

  indices = Delaunay.triangulate(vertices);

  /// shatter
  var p0, p1, p2,
        fragment;

  // var tl0 = new TimelineMax({onComplete:shatterCompleteHandler});

  for (var i = 0; i < indices.length; i += 3) {
      p0 = vertices[indices[i + 0]];
      p1 = vertices[indices[i + 1]];
      p2 = vertices[indices[i + 2]];

      fragment = new Fragment(p0, p1, p2, image);

      var dx = fragment.centroid[0] - clickPosition[0],
          dy = fragment.centroid[1] - clickPosition[1],
          d = Math.sqrt(dx * dx + dy * dy),
          rx = 30 * sign(dy),
          ry = 90 * -sign(dx),
          delay = d * 0.003 * randomRange(0.9, 1.1);
      fragment.canvas.style.zIndex = Math.floor(d).toString();

      var tl1 = new TimelineMax();


      tl1.to(fragment.canvas, 1, {
          z:-500,
          rotationX:rx,
          rotationY:ry,
          ease:Cubic.easeIn
      });
      tl1.to(fragment.canvas, 0.4,{alpha:0}, 0.6);

      // tl0.insert(tl1, delay);

      fragments.push(fragment);
      container.appendChild(fragment.canvas);
  }

  container.removeChild(image);
  image.removeEventListener('mouseover', imageBreak);

};


//////////////
// MATH UTILS
//////////////

function randomRange(min, max) {
    return min + (max - min) * Math.random();
}

function clamp(x, min, max) {
    return x < min ? min : (x > max ? max : x);
}

function sign(x) {
    return x < 0 ? -1 : 1;
}

//////////////
// FRAGMENT
//////////////

const Fragment = function(v0, v1, v2, image) {
    this.v0 = v0;
    this.v1 = v1;
    this.v2 = v2;

    this.computeBoundingBox();
    this.computeCentroid();
    this.createCanvas();
    this.clip(image);
};

Fragment.prototype = {
    computeBoundingBox:function() {
        var xMin = Math.min(this.v0[0], this.v1[0], this.v2[0]),
            xMax = Math.max(this.v0[0], this.v1[0], this.v2[0]),
            yMin = Math.min(this.v0[1], this.v1[1], this.v2[1]),
            yMax = Math.max(this.v0[1], this.v1[1], this.v2[1]);

        this.box ={
            x:xMin,
            y:yMin,
            w:xMax - xMin,
            h:yMax - yMin
        };
    },
    computeCentroid:function() {
        var x = (this.v0[0] + this.v1[0] + this.v2[0]) / 3,
            y = (this.v0[1] + this.v1[1] + this.v2[1]) / 3;

        this.centroid = [x, y];
    },
    createCanvas:function() {
        this.canvas = document.createElement('canvas');
        this.canvas.width = this.box.w;
        this.canvas.height = this.box.h;
        this.canvas.style.width = this.box.w + 'px';
        this.canvas.style.height = this.box.h + 'px';
        this.canvas.style.left = this.box.x + 'px';
        this.canvas.style.top = this.box.y + 'px';
        this.ctx = this.canvas.getContext('2d');
    },
    clip:function(image) {
        this.ctx.translate(-this.box.x, -this.box.y);
        this.ctx.beginPath();
        this.ctx.moveTo(this.v0[0], this.v0[1]);
        this.ctx.lineTo(this.v1[0], this.v1[1]);
        this.ctx.lineTo(this.v2[0], this.v2[1]);
        this.ctx.closePath();
        this.ctx.clip();
        this.ctx.drawImage(image, 0, 0);
    }
};
