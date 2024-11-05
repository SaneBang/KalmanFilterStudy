function [pos, vel] = DvKalman(z)

persistent A H Q R
persistent x P
persistent firstRun


% 초기화
if isempty(firstRun)
    firstRun = 1;

    dt = 0.1;
    A = [1 dt;    % 시스템 모델
         0 1];
    H = [0 1];    % 측정값 모델

    Q = [1 0;     % 측정 신뢰도??
         0 3];
    R = 1000;       % 센서 신뢰도

    x = [0 20]';   % 초기값 세팅
    P = 5 * eye(2);  % 초기 공분산 세팅
end


xp = A * x; % 모델 * 초기값 : 초기 예측값
Pp = A*P*A' + Q; % 예측 공분산?

K = Pp*H'*inv(H*Pp*H'+R);

x = xp + K * (z - H*xp);
P = Pp - K*H*Pp;


pos = x(1);
vel = x(2);
