# Generated by Django 2.2.2 on 2019-06-12 08:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='zip_code',
            field=models.PositiveIntegerField(blank=True, null=True),
        ),
    ]
