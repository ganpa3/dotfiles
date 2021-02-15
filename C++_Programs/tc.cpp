#include "bits/stdc++.h"

using namespace std;

#pragma GCC target("avx,avx2,fma")
#pragma GCC optimize("Ofast")
#define sz(x) (int)(x).size()
#define all(v) v.begin(), v.end()
#define endl '\n'
typedef long long ll;
typedef long double ld;
typedef unsigned long long ull;

string to_string(string s) {
    return '"' + s + '"';
}

string to_string(const char* s) {
    return to_string((string)s);
}

string to_string(bool b) {
    return (b ? "true" : "false");
}

template <typename A, typename B>
string to_string(pair<A, B> p) {
    return "(" + to_string(p.first) + ", " + to_string(p.second) + ")";
}

template <typename A>
string to_string(A v) {
    bool first = true;
    string res = "{";
    for (const auto& x : v) {
        if (!first) {
            res += ", ";
        }
        first = false;
        res += to_string(x);
    }
    res += "}";
    return res;
}

void debug_out() {
    cerr << endl;
}

template <typename Head, typename... Tail>
void debug_out(Head H, Tail... T) {
    cerr << " " << to_string(H);
    debug_out(T...);
}

void print() {
    cout << endl;
}

template <typename Head, typename... Tail>
void print(Head H, Tail... T) {
    cout << to_string(H) << " ";
    print(T...);
}

#ifdef GANPA
#define debug(...) cerr << "[" << #__VA_ARGS__ << "]:", debug_out(__VA_ARGS__)
#else
#define debug(...) 42
#endif

const ll RAN1 = 1e5 + 5;
const ll RAN2 = 2e5 + 5;
const ll RAN3 = 1e6;
const ll INF = 1e9;
const ll INFL = 1e18;

const ll NRAN1 = -100005;
const ll NRAN2 = -200005;
const ll NINF = -1000000000;
const ll NINFL = -1000000000000000000;

//#define int long long

random_device dev;
mt19937_64 rng(dev());  // Random number generator

// Generates random integers
template <typename A, typename B>
B ran(A l, B r) {
    uniform_int_distribution<B> dist(l, r);
    return dist(rng);
}

// Generates real(e.g. double) random numbers
template <typename A, typename B>
B rran(A l, B r) {
    uniform_real_distribution<B> dist(l, r);
    return dist(rng);
}

// Prints an array of random integers.
template <typename A, typename B>
void arr(size_t size, A l, B r) {
    for (size_t i = 0; i < size; i++) {
        cout << ran(l, r) << " ";
    }
    cout << endl;
}

// Prints an array of random real(e.g. double) numbers.
template <typename A, typename B>
void rarr(size_t size, A l, B r, int decimals = 2) {
    cout << setprecision(decimals) << fixed;
    for (size_t i = 0; i < size; i++) {
        cout << rran(l, r) << " ";
    }
    cout << endl;
}

string s1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
string s = "abcdefghijklmnopqrstuvwxyz";

bool test_case = 1;

int32_t main() {
    int tc = 100;
    if (test_case) cout << tc << endl;

    while (tc--) {
        auto n = ran(1, INF);
        print(n, ran(1, INF));
        //       arr(n, 1, INF);
    }
    return 0;
}
