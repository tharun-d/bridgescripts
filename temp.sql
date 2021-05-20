insert into
    template(
        template_id,
        channel_type,
        language,
        sender,
        subject,
        message,
        created_time,
        created_by,
        updated_by
    )
values
    (
        'trx.cpm.payment.out',
        4,
        'id',
        '',
        'Yay Transaksi Berhasil',
        'Transaksi senilai {{.topupAmount}} di {{.partnerName}} telah selesai. Total saldomu sekarang {{.balance}}',
        now(),
        0,
        0
    );

insert into
    template(
        template_id,
        channel_type,
        language,
        sender,
        subject,
        message,
        created_time,
        created_by,
        updated_by
    )
values
    (
        'trx.cpm.payment.amount.insufficient',
        4,
        'id',
        '',
        'Saldo Pembayaran Kurang',
        'Tenang, tinggal Top Up di Virgo, gampang kok',
        now(),
        0,
        0
    );

insert into
    template(
        template_id,
        channel_type,
        language,
        sender,
        subject,
        message,
        created_time,
        created_by,
        updated_by
    )
values
    (
        'trx.cpm.payment.amount.limit',
        4,
        'id',
        '',
        'Saldo Pembayaran Kurang',
        'Transaksi tidak dapat diproses karena melewati limit Rp500.000',
        now(),
        0,
        0
    );