function q = Tbn2Quat(R)

    t = trace(R);
    if (t > 0)
        t = sqrt(1 + t);
        q(1,1) = 0.5 * t;
        t = 0.5 / t;
        q(2,1) = (R(3,2) - R(2,3)) * t;
        q(3,1) = (R(1,3) - R(3,1)) * t;
        q(4,1) = (R(2,1) - R(1,2)) * t;
    elseif (R(1,1) > R(2,2) && R(1,1) > R(3,3))
        t = sqrt(1.0 + R(1,1) - R(2,2) - R(3,3));
        q(2,1) = 0.5 * t;
        t = 0.5 / t;
        q(1,1) = (R(3,2) - R(2,3)) * t;
        q(3,1) = (R(2,1) + R(1,2)) * t;
        q(4,1) = (R(1,3) + R(3,1)) * t;
    elseif (R(2,2) > R(3,3))
        t = sqrt(1.0 - R(1,1) + R(2,2) - R(3,3));
        q(3,1) = 0.5 * t;
        t = 0.5 / t;
        q(1,1) = (R(1,3) - R(3,1)) * t;
        q(2,1) = (R(2,1) + R(1,2)) * t;
        q(4,1) = (R(3,2) + R(2,3)) * t;
    else
        t = sqrt(1.0 - R(1,1) - R(2,2) + R(3,3));
        q(4,1) = 0.5 * t;
        t = 0.5 / t;
        q(1,1) = (R(2,1) - R(1,2)) * t;
        q(2,1) = (R(1,3) + R(3,1)) * t;
        q(3,1) = (R(3,2) + R(2,3)) * t;
    end

end