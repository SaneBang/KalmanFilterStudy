function volt = SimpleKalman(z)

persistent A H Q R
persistent x P
persistent firstRun

if isempty(firstRun)
    A = 1;
    H = 1;
    Q = 0;
    R = 4;

    x = 14;
    P = 6;

    firstRun = 1;
end

xp = A * x;  % 추정값 예측
Pp = A * P * A' + Q;  % 오차 공분산 예측

K = Pp * H' / (H * Pp * H' + R);  % 칼만 게인

x = xp + K * (z - H * xp);  % 추정값 계산
P = Pp - K*H*Pp; % 오차 공분산 업데이트

volt = x;
Px = P;