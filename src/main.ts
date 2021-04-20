import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { CONNECTION_SERVER } from './common/client';
import {
  fixedOldDate,
  getTimeFromNow,
} from './common/date';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  await app.listen(3000);


  const connection = CONNECTION_SERVER;

  const fixed = fixedOldDate;
  const date = getTimeFromNow(new Date().toISOString())
}
bootstrap();
