import 'dart:math';

class EditDistance {

  late int n;
  late int m;
  String s1;
  String s2;
  late List<List<int>> memo;
  int priority = 0;

  EditDistance(this.s1, this.s2) {
    n = s1.length;
    m = s2.length;
    int size = n > m ? n : m;
    memo = List.generate(size, (_) => List.filled(size, -1));
  }

  int calc(int i, int j) {
    if(i == n) return m - j;
    if(j == m) return n - i;
    if(memo[i][j] != -1) return memo[i][j];
    int res1 = 1000000000;
    if(s1[i] == s2[j]) res1 = calc(i, j);
    int res2 = calc(i + 1, j) + 1;
    int res3 = calc(i, j + 1) + 1;
    int res4 = calc(i + 1, j + 1) + 1;
    memo[i][j] = min(min(res1, res2), min(res3, res4));
    return memo[i][j];
  }

}