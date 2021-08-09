import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs/add/operator/map';

/*
  Generated class for the CirclesProvider provider.

  See https://angular.io/docs/ts/latest/guide/dependency-injection.html
  for more info on providers and Angular DI.
*/
@Injectable()
export class CirclesProvider {

  circles = [
    {
      x: 50, y: 50, radius: 10,
      xMove: this.randInt(5) - 2, // -2..2
      yMove: this.randInt(5) - 2
    },
    {
      x: 75, y: 75, radius: 20,
      xMove: this.randInt(5) - 2, // -2..2
      yMove: this.randInt(5) - 2
    },
    {
      x: 115, y: 115, radius: 30,
      xMove: this.randInt(5) - 2, // -2..2
      yMove: this.randInt(5) - 2
    }
  ];
  canvasWidth: any;
  canvasHeight: any;
  update(width, height) {
    this.canvasWidth = width;
    this.canvasHeight = height;
    for (const circle of this.circles) {
      // circle.x += circle.xMove;
      // circle.y += circle.yMove;
      this.moveCircle(circle);
    }
  }

moveCircle(circle) {
    circle.x += circle.xMove;
    circle.y += circle.yMove;
    if (circle.x > (this.canvasWidth + circle.radius)) {
      circle.x = 0 - circle.radius;
    }
    if (circle.x < (0 - circle.radius)) {
      circle.x = this.canvasWidth + circle.radius;
    }
    if (circle.y > (this.canvasHeight + circle.radius)) {
      circle.y = 0 - circle.radius;
    }
    if (circle.y < (0 - circle.radius)) {
      circle.y = this.canvasHeight + circle.radius;
    }
  }


  randInt(max) {
    return Math.floor(Math.random() * max);
  }

}
