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
    memo = List.generate(n, (_) => List.filled(m, -1));
  }

  int calc(int i, int j) {
    if(i == n) return m - j;
    if(j == m) return n - i;
    if(memo[i][j] != -1) return memo[i][j];
    int resEqual = 1000000000;
    if(s1[i] == s2[j]) resEqual = calc(i, j);
    int resInsert = calc(i + 1, j) + 1;
    int resDelete = calc(i, j + 1) + 1;
    int resReplace = calc(i + 1, j + 1) + 1;
    memo[i][j] = min(min(resEqual, resInsert), min(resDelete, resReplace));
    return memo[i][j];
  }

}