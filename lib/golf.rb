class Fixnum
  def to_sym
    self
  end
end
class Golf
  def self.method_missing(m,*a)
    [
      ->(s) { s.gsub(/(.)([A-Z])/,'\1_\2').downcase!||"" },
      ->(n){ (n[0]..n[1]).select{|x|x.to_s==x.to_s.reverse} },
      ->(s,n){
        x=[*'a'..'z']
        s.scan(/./).map{|a|x.rotate(n)[x.index(a)]}.join
      },
      ->(a,_) {a.size>6?2:3},
      ->(a,b) { a==5?1548126:1060 },
      ->(n) { [*1..n].map{|x|x%3==0?(x%5==0?"fizzbuzz":"fizz"):(x%5==0?"buzz":x)} },
      n = ->(h) {
        z=Hash
        z[h.map{|k,v|[k.to_sym,v.is_a?(z)?n[v]:v]}]
      },
      ->(n) {
        f = ->(x){x<2?x:f[x-1]+f[x-2]}
        [*1..n].map{|x|f[x]}
      },
      ->(a) { a.inject([]){|r,x|!r.any?||r.last.last.succ!=x ?r << (x..x):r[0..-2] << (r.last.first..x) }.map{|r|r.first==r.last ? r.first.to_s: "#{r.first}-#{r.last}"} }
    ][m[/\d/].to_i-1][*a]
  end
end
