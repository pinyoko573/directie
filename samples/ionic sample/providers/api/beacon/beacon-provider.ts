import { Injectable } from '@angular/core';
import { Platform, Events } from 'ionic-angular';
import { IBeacon } from '@ionic-native/ibeacon';
import 'rxjs/add/operator/toPromise';
import { Http, Response, Headers, RequestOptions } from '@angular/http';
import * as jsonQuery from 'json-query';
import { Global } from '../../../global';

@Injectable()
export class BeaconProvider {
  constructor(
    public platform: Platform,
    public events: Events,
    private http: Http,
    private ibeacon: IBeacon,
    private global: Global
    ) {

  }
  url = 'http://ec2-54-179-182-168.ap-southeast-1.compute.amazonaws.com/mapi/api/mobilebeacons/getalldata/';
  data: any
  locationid: any
  getData(locationid) {

    return new Promise(resolve => {
      if (this.locationid != locationid) {
        console.log('from server');


        let headers = new Headers({ 'Content-Type': 'application/json', });
        let options = new RequestOptions({ headers: headers });
        this.http.get(this.url + locationid, options).toPromise().then(data => {
          this.locationid = locationid;
          this.data = data.json();
          resolve(this.data);
        });
      } else {
        console.log('from memory');
        resolve(this.data);
      }
    })

  }

  getBeacons() {

    let beacons = jsonQuery('beacons', {
      data: this.data
    }).value;
    // console.dir(beacons);
    return beacons;
  }

  getMap(beaconId) {
    console.log(beaconId);
    let mapId = jsonQuery('beaconUnits[beaconId=' + beaconId + '].mapId', {
      data: this.data
    }).value;
    // console.log('mapid');
    // console.dir(mapId);
    let map = jsonQuery('maps[mapId=' + mapId + ']', {
      data: this.data
    }).value;
    let response = {
      svg: map.svg,
      level: map.level
    }
    // console.dir(svg);
    return response;
  }

  getDefaultMap() {
    let map = jsonQuery('maps[*locationId=' + this.global.locationId + ']', {
      data: this.data
    }).value;
    console.dir(map);

    // console.dir(map);
    return map;
  }

  getBeaconInfo(beaconId) {
    let beacon = jsonQuery('beaconUnits[beaconId=' + beaconId + '].unit', {
      data: this.data
    }).value;
    console.dir(beacon);
    let info = {
      block: beacon.block,
      unitNo: beacon.unitNo,
      unitId: beacon.unitId,
      facilityId: beacon.facilityId,
      eventId : beacon.eventId
    };
    return info;
  }

  getFacilitiesByBeaconId(beaconId) {
    let level = jsonQuery('beaconUnits[beaconId=' + beaconId + '].level', {
      data: this.data
    }).value;
    console.log(level);
    let facilities = jsonQuery('facilities[**][*level=' + level + '].url', {
      data: this.data
    }).value;
    let response = [];
    let length = 0;
    if (facilities.length >= 3) {
      length = 3;
    } else {
      length = facilities.length;
    }
    for (let i = 0; i < length; i++) {
      response.push(facilities[i]);
    };
    console.dir(response);
    return response;
    // let response = { 
    //   url: facilities.url
    // };
    // return URL
  }
  getFacilitiesByLevel(level) {
    let facilities = jsonQuery('facilities[**][*level=' + level + '].url', {
      data: this.data
    }).value;
    let response = [];
    let length = 0;
    if (facilities.length >= 3) {
      length = 3;
    } else {
      length = facilities.length;
    }
    for (let i = 0; i < length; i++) {
      response.push(facilities[i]);
    };
    console.dir(response);
    return response;
  }

  getFacilities(level) {
    // let level = jsonQuery('beaconUnits[beaconId=' + beaconId + '].level', {
    //   data: this.data
    // }).value;
    // console.log(level);
    let facilities = jsonQuery('facilities[**][*level=' + level + ']', {
      data: this.data
    }).value;

    console.dir(facilities);
    return facilities;
  }

  getUnitsFromFacilityId(id) {
    let units = jsonQuery('beaconUnits[**].unit[*facilityId=' + id + '].unitNo', {
      data: this.data
    }).value;
    // let response = [];
    // console.dir(units);
    // // for (let i of units) {
    // //   response.push(i.unitNo);
    // // }
    // console.dir(response);
    return units;
    // console.dir(beacon); 
  }

  getFacilityFromUnitId(id) {
    let facility = jsonQuery('beaconUnits[**].unit[unitId=' + id + ']', {
      data: this.data
    }).value;
    console.dir(facility);
    if (facility) {
      return facility.facilityId;
    }
    else {
      return facility;
    }
  }

  getUnit(unitNo) {
    let unit = jsonQuery('beaconUnits[**].unit[unitNo=' + unitNo + '].unitId', {
      data: this.data
    }).value;
    console.dir(unit);
    return unit;

  }
  checkUnit(unitNo) {
    let unit = jsonQuery('beaconUnits[**].unit[unitNo=' + unitNo + ']', {
      data: this.data
    }).value;
    console.dir(unit);
    if (unit)
      return true;
    else {
      return false
    }
  }

}
