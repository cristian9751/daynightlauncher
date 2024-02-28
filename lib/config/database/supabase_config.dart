import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBaseConfig {
  static const String url = "https://tfpowrulvhfqbhzefmuc.supabase.co";
  static const String key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRmcG93cnVsdmhmcWJoemVmbXVjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDkwMzI3MDQsImV4cCI6MjAyNDYwODcwNH0.hFGHhcvibKH49-rpDhODNUC9uMddvs1Ad8BSBfqzOf8";


  Future<SupabaseClient> getSupaBaseClient() async {
    await Supabase.initialize(
      url : url,
      anonKey : key,
    );

    return Supabase.instance.client;
  }
}