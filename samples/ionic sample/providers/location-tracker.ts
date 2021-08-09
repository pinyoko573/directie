import { Injectable, NgZone } from '@angular/core';
//import { BackgroundGeolocation } from '@ionic-native/background-geolocation';
import { Geolocation, Geoposition } from '@ionic-native/geolocation';
import 'rxjs/add/operator/filter';

@Injectable()
export class LocationTracker {

  public watch: any;
  public lat: number = 0;
  public lng: number = 0;




  constructor(public zone: NgZone,
    //private backgroundGeolocation: BackgroundGeolocation,
    private geolocation: Geolocation) {

  }

  startTracking() {
    // Background Tracking
    // // return new Promise(resolve => {
    //   let config = {
    //     desiredAccuracy: 0,
    //     stationaryRadius: 20,
    //     distanceFilter: 10,
    //     debug: false,
    //     interval: 2000
    //   };

    //   return this.backgroundGeolocation.configure(config).toPromise();

    // // Turn ON the background-geolocation system.
    // this.backgroundGeolocation.start();


    // // Foreground Tracking

    let options = {
      frequency: 3000,
      enableHighAccuracy: true
    };

    return this.geolocation.getCurrentPosition();

  } //end startTracking

  stopTracking() {
    console.log('stopTracking');
    //this.backgroundGeolocation.finish();
    this.watch.unsubscribe();

  } //end stopTracking

} //end class
