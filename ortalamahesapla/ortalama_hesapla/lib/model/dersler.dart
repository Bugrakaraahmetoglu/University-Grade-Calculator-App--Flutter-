class Ders{
  final String ad;
  final double harfdegeri;
  final double kredidegeri;

  Ders({ required this.ad,required this.harfdegeri, required this.kredidegeri});

  @override
  String toString() {

    return '$ad $harfdegeri $kredidegeri';
  }
}