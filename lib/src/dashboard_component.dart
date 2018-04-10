import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'route_paths.dart' as paths;
import 'hero.dart';
import 'hero_service.dart';

@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  styleUrls: ['dashboard_component.css'],
  directives: [coreDirectives, routerDirectives],
)
class DashboardComponent implements OnInit {
  List<Hero> heroes;

  final HeroService _heroService;

  DashboardComponent(this._heroService);

  String heroUrl(int id) =>
      paths.hero.toUrl(parameters: {paths.idParam: id.toString()});

  Future<void> ngOnInit() async {
    heroes = (await _heroService.getAll()).skip(1).take(4).toList();
  }
}