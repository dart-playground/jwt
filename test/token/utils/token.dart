final String requestTest = r'''
{
  "id" : "1",
  "dsc" : "Teste"
}
''';

final validToken =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIzLCJzZXJ2ZXIiOnsiaWQiOiIzZTRmYzI5NiIsImxvYyI6ImV1dy0yIn0sImlhdCI6MTYyMzg2NDc0NCwiZXhwIjoyNDg3ODY0NzQ0LCJpc3MiOiJodHRwczovL2dpdGh1Yi5jb20vam9uYXNyb3Vzc2VsL2pzb253ZWJ0b2tlbiJ9.a22r0LMCFiTlkNBWil-EFgmquyfB5pbWbj8AILa584Q';

final invalidToken =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIzLCJzZXJ2ZXIiOnsiaWQiOiIzZTRmYzI5NiIsImxvYyI6ImV1dy0yIn0sImlhdCI6MTYyMzg2NDM3OCwiZXhwIjoxNjIzODY2MTc4LCJpc3MiOiJodHRwczovL2dpdGh1Yi5jb20vam9uYXNyb3Vzc2VsL2pzb253ZWJ0b2tlbiJ9.57coo3dtm8bsKDB49eakI0eppHKoEGsud9bVKpFg0vk';
