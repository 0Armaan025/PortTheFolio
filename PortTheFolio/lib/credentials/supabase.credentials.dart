import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBaseCredentials {
  static const String API_KEY =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9naWZ3YWVsY3BvanZxeXl6aHZtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODU3Njc4NjIsImV4cCI6MjAwMTM0Mzg2Mn0.MNBnb_sm-jgIj-8khkbAH80WVDZohPW_JeXQU_AprF0";
  static const String API_URL = "https://ogifwaelcpojvqyyzhvm.supabase.co";

  static SupabaseClient supabaseClient = SupabaseClient(API_URL, API_KEY);
}
