import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../config/database/supabase_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthProvider extends ChangeNotifier {
       SupabaseClient? supabase = null;
       Session? session = null;
       late  SharedPreferences _preferences;

      Future initialize() async {
        supabase = await SupaBaseConfig().getSupaBaseClient();
        _preferences = await SharedPreferences.getInstance();

        final cachedSession = _preferences.getString("session");

        if(cachedSession != null) {
          session = jsonDecode(cachedSession);
        }

        supabase?.auth.onAuthStateChange.listen((data) async {
          final AuthChangeEvent event = data.event;
          if(event == AuthChangeEvent.signedIn) {
            session = supabase?.auth.currentSession;
            final jsonSession = session?.toJson();
            if(checkWhiteList(jsonSession?['user']['discord_username']) == false) {
              session = null;
              return;
            }
            _preferences.setString('session', jsonEncode(jsonSession));
          } else if(event == AuthChangeEvent.signedOut) {
            _preferences.remove('session');
          }
        });
        notifyListeners();
    }


    Future<bool> checkWhiteList(String discordUsername) async {
        final data = await supabase?.from('usuarios').select().eq('discord_user', discordUsername);
        return data != null && data.isNotEmpty;



    }

    Future signInWithDiscord() async {
        await supabase?.auth.signInWithOAuth(
            OAuthProvider.discord,
            redirectTo: 'daynightrplauncher://login'
        );

    }

    void signOut() async {
        await supabase?.auth.signOut();
    }
}
