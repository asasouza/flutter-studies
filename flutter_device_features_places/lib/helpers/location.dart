const GOOGLE_API_KEY = 'AIzaSyBtXh1L0SYkb2JuBDvZ6A5n54NhMRsAJIE';

class LocationHelper {
  static getLocationImageUrl({double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}