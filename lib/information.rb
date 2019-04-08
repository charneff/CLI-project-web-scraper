class Information 
    attr_accessor :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o, :q, :r, :s, :t, :u, :v, :w, :x, :y, :z
    @@all = []

    def initialize(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,q,r,s,t,u,v,w,y,z) 
        @a = a
        @b = b
        @c = c
        @d = d 
        @e = e 
        @f = f 
        @g = g
        @h = h
        @i = i
        @j = j
        @k = k 
        @l = l 
        @m = m
        @n = n
        @o = o
        @q = q 
        @r = r 
        @s = s 
        @t = t
        @u = u 
        @v = v
        @w = w
        @x = x 
        @y = y 
        @z = z
    end

    def self.all
        @@all 
    end
    
    def save 
        @@all << self 
    end

end
