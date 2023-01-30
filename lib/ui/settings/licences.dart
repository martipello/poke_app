// ignore_for_file: avoid_classes_with_only_static_members
import 'package:tuple/tuple.dart';

class Licences {
  static List<Tuple2<String, String>> get licences => [
        Tuple2('Flavorizer', flavorizerLicence),
        Tuple2('Logger', loggerLicence),
        Tuple2('Dio', dioLicence),
        Tuple2('Http', httpLicence),
        Tuple2('Intl', intlLicence),
        Tuple2('Flutter', flutterLicence),
        Tuple2('Shared Preferences', sharedPreferencesLicence),
        Tuple2('Built Value', builtValueLicence),
        Tuple2('Package Info', packageInfoLicence),
        Tuple2('Url Launcher', urlLauncherLicence),
        Tuple2('Path Provider', pathProviderLicence),
        Tuple2('RxDart', rxdartLicence),
        Tuple2('Infinite Scroll', infiniteScrollLicence),
        Tuple2('GetIt', getItLicence),
        Tuple2('Native Splash', nativeSplashLicence),
        Tuple2('Launcher Icons', launcherIconsLicence),
        Tuple2('Tuple', tupleLicence),
      ];

  static String get providerLicence => _mitLicence('2019 Remi Rousselet');

  static String get flavorizerLicence => _mitLicence('2021 MyLittleSuite');

  static String get loggerLicence => _mitLicence('2019 Simon Leier');

  static String get dioLicence => _mitLicence('2018 wendux');

  static String get httpLicence => _bsdLicence('2014 The Flutter Authors.');

  static String get intlLicence => _bsdLicence('2014 The Flutter Authors.');

  static String get flutterLicence => _bsdLicence('2014 The Flutter Authors.');

  static String get sharedPreferencesLicence => _bsdLicence('2013 The Flutter Authors.');

  static String get builtValueLicence => _bsdLicence('2015, Google Inc.');

  static String get packageInfoLicence => _bsdLicence('2013 The Flutter Authors.');

  static String get urlLauncherLicence => _bsdLicence('2013 The Flutter Authors.');

  static String get pathProviderLicence => _bsdLicence('2013 The Flutter Authors.');

  static String get rxdartLicence => _apacheLicence();

  static String get infiniteScrollLicence => _mitLicence('2021 Edson Bueno');

  static String get getItLicence => _mitLicence('2018 Thomas Burkhart');

  static String get nativeSplashLicence => _mitLicence('2019 Mark O\'Sullivan');

  static String get launcherIconsLicence => _mitLicence('2019 Mark O\'Sullivan');

  static String get tupleLicence => _bsdLicence('2014, the tuple project authors');

  static String _mitLicence(String nameAndDate) {
    return '''MIT License

Copyright (c) $nameAndDate

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.''';
  }

  static String _bsdLicence(String nameAndDate) {
    return '''  
Copyright $nameAndDate All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above
   copyright notice, this list of conditions and the following
   disclaimer in the documentation and/or other materials provided
   with the distribution.
 * Neither the name of Google Inc. nor the names of its
   contributors may be used to endorse or promote products derived
   from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.''';
  }

  static String _apacheLicence() {
    return '''Licensed under the Apache License, Version 2.0 (the "License"); you
may not use this file except in compliance with the License. You may
obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
implied. See the License for the specific language governing permissions
and limitations under the License.''';
  }

}
