drop index IDX_BOOKING_NUM_UP;
create index IDX_BOOKING_NUM_UP on BOOKING (
   upper(BOOKING_NUM) ASC
);